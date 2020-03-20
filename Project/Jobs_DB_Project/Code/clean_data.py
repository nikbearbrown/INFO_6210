import json

with open('data.json') as json_data:
	data = json.load(json_data)
	for item in data:
		if 'alcohol_beer_wine' in item:
			del item['alcohol_beer_wine']
		if 'reservations' in item:
			del item['reservations'] 
		if 'alcohol_bar' in item:
			del item['alcohol_bar']
		if 'founded' in item:
			del item['founded']
		if 'parking' in item:
			del item['parking']
		if 'owner' in item:
			del item['owner']
		if 'neighborhood' in item:
			del item['neighborhood']
		if 'groups_goodfor' in item:
			del item['groups_goodfor']
		if 'parking_free' in item:
			del item['parking_free']
		if 'alcohol' in item:
			del item['alcohol']
		if 'parking_valet' in item:
			del item['parking_valet']
		if 'payment_cashonly' in item:
			del item['payment_cashonly']
		if 'category_ids' in item:
			del item['category_ids']
		if 'latitude' in item:
			del item['latitude']
		if 'fax' in item:
			del item['fax']
		if 'hours' in item:
			del item['hours']
		if 'factual_id' in item:
			del item['factual_id']
		if 'smoking' in item:
			del item['smoking']
		if 'kids_goodfor' in item:
			del item['kids_goodfor']
		if 'parking_street' in item:
			del item['parking_street']
		if 'open_24hrs' in item:
			del item['open_24hrs']
		if 'country' in item:
			del item['country']
		if 'wifi' in item:
			del item['wifi']
		if 'accessible_wheelchair' in item:
			del item['accessible_wheelchair']
		if 'longitude' in item:
			del item['longitude']
		if 'seating_outdoor' in item:
			del item['seating_outdoor']
		if 'tel_normalized' in item:
			del item['tel_normalized']
	with open('clean_data.json', 'w') as outfile:
		json.dump(data, outfile)
