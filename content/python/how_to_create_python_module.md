+++
title = "How to create open source Python module"
description = "How to create open source Python module"
date = "2016-12-20T20:29:36+09:00"
categories = ["python"]
tags = [
  "python",
  "opensource",
]
image = ""
+++

You have created a fantastic python package and you want to share with the world.
You need to put it together as python package and include necessary files to help you share it with open source communities.
In this article, I am going to explain how to create open-source python project from scratch and upload it to PIP.
We will create a simple python library that runs asynchronous function periodically.

## Idea

`asyncio` is built-in asynchronous library that allows you to use `event loops` to execute tasks asynchronously.
By default, it does not have a feature to run asynchronous function periodically such as Tornado's PeriodcTask or Golang's Timer.
We are going to name it `aio_periodic_task`.
You can find a complete library here at https://github.com/sickyoon/aio_periodic_task.git

## Structure

Here is a structure for `aio_periodic_task`
Your python module should have same structure with project name replaced with your own.

```bash
aio_periodic_task/
  aio_periodic_task/   # python module
    __init__.py        # initial script for python package
    periodic_task.py   # our library
  LICENSE              # license file
  README.md            # readme file
  requirements.txt     # required dependencies
  setup.py             # package setup file
```

## Writing Package

### __init__.py

Typical package `__init__.py` involves `__version__` value and import functions or classes that should be made global.

```python
# __init__.py
from .periodic_task import PeriodicTask
__version__ = '0.1.0'
```

In this file, we made class called `PeriodicTask` global to `aio_periodic_task` package.
In that way, we can call `from aio_periodic_task import PeriodicTask` instead of `from aio_periodic_task.periodic_task import PeriodicTask`.
Also we define `__version__` of our package that will be made available in our `setup.py` file described later.

### periodic_task.py

Now we create a class that takes asynchronous function as callback and runs every x seconds.

```python
# periodic_task.py
class PeriodicTask:
  
  def __init__(self, loop, interval, callback):
    self._loop = loop if loop else asyncio.get_event_loop()
    self._interval = interval
    self._callback = callback
    self._num_executed = 0
    self._running = False
    self._tasks = []
  
  @asyncio.coroutine
  def wrapped(self):
    yield from self._callback()
    self._num_executed += 1
    if self._running:
      yield from asyncio.sleep(self._interval)
      self._tasks.append(asyncio.ensure_future(self.wrapped()))

  @asyncio.coroutine
  def start(self):
    self._running = True
    self._tasks.append(asyncio.ensure_future(self.wrapped()))

  @asyncio.coroutine
  def stop(self):
    self._running = False
    tasks = asyncio.gather(*self._tasks)
    tasks.cancel()

  @property
  def num_executed(self):
    return self._num_executed
```

## Writing Test

Unit tests are crucial element when developing open-source library.
You can automate them through Travis CI.

## Creating setup.py file

`setup.py` file provides convenient way to install your python module.
For more information, refer to [Installing Python Modules] for details.

```bash
python setup.py install
```

### Defining setup()

`setup.py` must call `setup()` from `setuptools` module as shown in below example.

```python
from setuptools import setup, find_packages
setup(
  name = "MY_PROJECT_NAME",
  version = read_version(),
  description = "MY PROJECT DESCRIPTION",
  classifiers = classifiers,
  platforms = ["POSIX"],
  author = "Sick Yoon",
  author_email = "sick.yoon@gmail.com",
  url = "https://github.com/sickyoon/MY_PROJECT_NAME",
  keywords = ["project"],
  license = "MIT",
  packages = find_packages(exclude=["tests"]),
  install_requires = install_requires,
  include_package_data = True
)
```

Most of code above are pretty much self-explanatory.
You can replace them with your package-specific values.

### Helper Functions

As you would have noticed, `setup()` code above won't work as is as it is missing helper functions.
These helper functions are very useful to define your package.

##### read_version()

`read_version()` gets version value from `__init__.py` found in module directory.
In this way, you have same version value available in both `setup.py` and in your module.

```python
# read_version()
import re,os
def read_version():
  regexp = re.compile(r"^__version__\W*=\W*'([\d.abrc]+)'")
  init_py = os.path.join(os.path.dirname(__file__), 'MY_PROJECT_NAME', '__init__.py')
  with open(init_py) as f:
    for line in f:
      match = regexp.match(line)
      if match is not None:
        return match.group(1)
    raise RuntimeError('Cannot find version in tornado_router/__init__.py')
```

##### classifiers

*classifiers* are list of strings to categorize your module.
You can define things like license, development status, programming langague etc.

```python
classifiers = [
  'License :: OSI Approved :: MIT License',
  'Development Status :: 3 - Alpha',
  'Programming Language :: Python',
  'Programming Language :: Python :: 3',
  'Programming Language :: Python :: 3.4',
  'Programming Language :: Python :: 3.5',
  'Operating System :: POSIX',
  'Environment :: Web Environment',
  'Intended Audience :: Developers',
  'Topic :: Software Development',
  'Topic :: Software Development :: Libraries',
]
```

## Upload to PIP

Now your package is ready to be uploaded to PIP.
This is covered in my next article `How to upload python module to PIP`

[Installing Python Modules]: https://docs.python.org/3.5/install/


