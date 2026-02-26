import geopandas as gpd
import matplotlib.pyplot as plt
import contextily as ctx
import pandas as pd
import pathlib
from matplotlib_map_utils.core.north_arrow import NorthArrow, north_arrow
from matplotlib_map_utils.core.scale_bar import ScaleBar, scale_bar

plt.rcParams['font.family'] = 'Malgun Gothic'
plt.rcParams['axes.unicode_minus'] = False

script_dir = pathlib.Path(__file__).parent

df = pd.read_csv(script_dir.parent / 'Data' / 'LPV_Coordinate.csv')
df = df[df['세부기종'] != '기타']
gdf = gpd.GeoDataFrame(df, geometry=gpd.points_from_xy(df['X'], df['Y']))
gdf.set_crs(epsg=4326, inplace=True)

fig, ax = plt.subplots(figsize=(7.5, 7.5))
gdf[gdf['형식'] == 'A1'].plot(ax=ax, color='red', marker='o', markersize=40, edgecolor='black', linewidth=1, label='A1')
gdf[gdf['형식'] == 'A2a'].plot(ax=ax, color='orange', marker='o', markersize=40, edgecolor='black', linewidth=1, label='A2a')
gdf[gdf['형식'] == 'A2b'].plot(ax=ax, color='yellow', marker='o', markersize=40, edgecolor='black', linewidth=1, label='A2b')
gdf[gdf['형식'] == 'B1'].plot(ax=ax, color='blue', marker='^', markersize=40, edgecolor='black', linewidth=1, label='B1')
gdf[gdf['형식'] == 'B2'].plot(ax=ax, color='lightblue', marker='^', markersize=40, edgecolor='black', linewidth=1, label='B2')
gdf[gdf['형식'] == 'C1a'].plot(ax=ax, color='green', marker='s', markersize=40, edgecolor='black', linewidth=1, label='C1a')
gdf[gdf['형식'] == 'C1b'].plot(ax=ax, color='lightgreen', marker='s', markersize=40, edgecolor='black', linewidth=1, label='C1b')
gdf[gdf['형식'] == 'C2'].plot(ax=ax, color='gray', marker='s', markersize=40, edgecolor='black', linewidth=1, label='C2')

ax.legend(title='범례',loc='upper right', frameon=True, edgecolor='black', fontsize=12, title_fontsize=14)
scale_bar(ax, location="lower right", style="ticks", bar={"projection": gdf.crs})
north_arrow(ax, location="upper left", rotation={"crs": gdf.crs, "reference": "center"})

with open(script_dir / 'api_key.txt', 'r') as f:
    api_key = f.read().strip()
stadia_provider = ctx.providers.Stadia.StamenTerrainBackground()
stadia_provider["url"] += "?api_key=" + api_key
ctx.add_basemap(ax, source=stadia_provider, crs=gdf.crs, attribution="")

plt.savefig(script_dir.parent / 'Graph' / 'Distribution(형식별).tiff', dpi=300)
plt.savefig(script_dir.parent / 'Graph' / 'Distribution(형식별).jpg', dpi=300)
plt.show()