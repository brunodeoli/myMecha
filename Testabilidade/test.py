import unittest
from detector import Statistic, DecisionTree

samples = dict()

samples['data'] = [
    {'Temperatura': 65, 'Umidade': 83, 'Anomaly': 0},
    {'Temperatura': 65, 'Umidade': 86, 'Anomaly': 0},
    {'Temperatura': 68, 'Umidade': 81, 'Anomaly': 0},
    {'Temperatura': 63, 'Umidade': 88, 'Anomaly': 0},
    {'Temperatura': 60, 'Umidade': 86, 'Anomaly': 0},
    {'Temperatura': 82, 'Umidade': 103, 'Anomaly': 1},
    {'Temperatura': 83, 'Umidade': 106, 'Anomaly': 0},
    {'Temperatura': 88, 'Umidade': 100, 'Anomaly': 0},
    {'Temperatura': 85, 'Umidade': 107, 'Anomaly': 0},
    {'Temperatura': 82, 'Umidade': 109, 'Anomaly': 0},
    {'Temperatura': 103, 'Umidade': 125, 'Anomaly': 1},
    {'Temperatura': 102, 'Umidade': 124, 'Anomaly': 0},
    {'Temperatura': 107, 'Umidade': 126, 'Anomaly': 0},
    {'Temperatura': 106, 'Umidade': 129, 'Anomaly': 0},
    {'Temperatura': 106, 'Umidade': 126, 'Anomaly': 0},
    {'Temperatura': 121, 'Umidade': 143, 'Anomaly': 1},
    {'Temperatura': 126, 'Umidade': 146, 'Anomaly': 0},
    {'Temperatura': 121, 'Umidade': 142, 'Anomaly': 0},
    {'Temperatura': 122, 'Umidade': 144, 'Anomaly': 0},
    {'Temperatura': 123, 'Umidade': 140, 'Anomaly': 0},
    {'Temperatura': 144, 'Umidade': 165, 'Anomaly': 1},
    {'Temperatura': 147, 'Umidade': 168, 'Anomaly': 0},
    {'Temperatura': 144, 'Umidade': 169, 'Anomaly': 0},
    {'Temperatura': 143, 'Umidade': 164, 'Anomaly': 0},
    {'Temperatura': 145, 'Umidade': 165, 'Anomaly': 0},
    {'Temperatura': 161, 'Umidade': 183, 'Anomaly': 1},
    {'Temperatura': 165, 'Umidade': 189, 'Anomaly': 0},
    {'Temperatura': 160, 'Umidade': 187, 'Anomaly': 0},
    {'Temperatura': 166, 'Umidade': 182, 'Anomaly': 0},
    {'Temperatura': 164, 'Umidade': 180, 'Anomaly': 0},
    {'Temperatura': 61, 'Umidade': 83, 'Anomaly': 1},
    {'Temperatura': 61, 'Umidade': 85, 'Anomaly': 0},
    {'Temperatura': 66, 'Umidade': 81, 'Anomaly': 0},
    {'Temperatura': 67, 'Umidade': 80, 'Anomaly': 0},
    {'Temperatura': 60, 'Umidade': 84, 'Anomaly': 0}
]

class TestStat(unittest.TestCase):

    def setUp(self):
        print("setUp")
        self._detector = Statistic(samples, 'Temperatura')

    def tearDown(self):
        print("tearDown")
        pass
    
    def test_updatedata(self):
        print("test_updatedata")
        with self.assertRaises(TypeError):
            self._detector.updateData(10, None)

    def test_checkanomaly(self):
        print("test_checkanomaly")
        with self.assertRaises(TypeError):
            self._detector.checkAnomaly('25','10')
        
class TestDT(unittest.TestCase):

    def setUp(self):
        print("setUp")
        self._detector = DecisionTree('dataset_test.csv')

    def tearDown(self):
        print("tearDown")
        pass

    def test_predictTree(self):
        print("test_predictTree")
        with self.assertRaises(TypeError):
            self._detector.predictTree(10)

if __name__ == '__main__':
    unittest.main()