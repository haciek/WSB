import numpy as np
import pandas as pd
from pymcdm.methods import TOPSIS, SPOTIS
from pymcdm.normalizations import minmax_normalization
from pymcdm.helpers import rankdata
from pymcdm.weights import entropy_weights


criteria_names = ['Cost', 'Profit', 'Risk']
alternatives = np.array([ 
    [85, 20, 0.3],
    [70, 15, 0.2],
    [55, 35, 0.5],
    [90, 10, 0.1],
    [40, 25, 0.4],
    [60, 30, 0.6],
    [95, 5,  0.05],
    [30, 38, 0.8],
    [50, 18, 0.25],
    [75, 12, 0.15]
])
weights = entropy_weights(alternatives)
types = [-1, 1, -1]
bounds = np.array([
    [0, 100],
    [0, 40],
    [0, 1],
])

normalized_matrix = minmax_normalization(alternatives, types)

topsis_data = TOPSIS()(normalized_matrix, weights, types)
spotis_data = SPOTIS(bounds)(alternatives, weights, types)

results = pd.DataFrame({
    'Alternative': [f'A: {n}' for n in range(1, len(alternatives) + 1)],
    'TOPSIS Data': topsis_data,
    'TOPSIS Rank': rankdata(topsis_data, reverse=True),
    'SPOTIS Data': spotis_data,
    'SPOTIS Rank': rankdata(spotis_data),
})

print(results.sort_values('TOPSIS Rank'))