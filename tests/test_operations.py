import pytest
from calculator import operations


def test_add():
    assert operations.add(2, 3) == 5


def test_subtract():
    assert operations.subtract(5, 2) == 3


def test_multiply():
    assert operations.multiply(3, 4) == 12


def test_divide():
    assert operations.divide(10, 2) == 5


def test_divide_by_zero():
    with pytest.raises(ValueError):
        operations.divide(5, 0)
