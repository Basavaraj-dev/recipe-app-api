from django.test import SimpleTestCase

from app import calc


class ClackTest(SimpleTestCase):
    def test_add_numbers(self):
        res = calc.calc1(4, 5)
        self.assertEquals(res, 9)
