from math import sqrt
import pandas as pd
from pandas import DataFrame, read_csv


def load_data() -> DataFrame:
    """Naloži matriko izražanja."""

    data: DataFrame = read_csv("/home/pogacha/progAAAAAAA/AVB/hw_2/matrika-izrazanja.csv")
    assert isinstance(data, DataFrame)

    return data


def get_row(m: DataFrame, rownum: int) -> list[int | float]:
    """Izvleče eno vrstico iz matrike."""

    assert 0 <= rownum < m.shape[0]

    return m.to_numpy()[rownum].tolist()[1:]


def v(x: list[float], y: list[float]) -> list[float]:
    """Izračuna nov vektor v, ki je aritmetično sredina komponent vektorjev x in y."""

    assert x != [] and y != []
    assert len(x) == len(y)

    sum: list[float] = [0.0] * len(x)
    for i in range(len(x)):
        sum[i] = (x[i] + y[i]) / 2

    return sum


def d(x: list[float], y: list[float]) -> float:
    """Izračuna evklidsko razdaljo med vektorjema x in y."""

    assert x != [] and y != []
    assert len(x) == len(y)

    sum: float = 0.0
    for i in range(len(x)):
        sum += (x[i] - y[i]) ** 2

    return sqrt(sum)
