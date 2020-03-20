tags_document = {
				'machine learning':[AI,data science],
				'marvel':[avengers,iron man]
				}				
				
				
semantic_document = {
				'semnatic':[related_semnatic1,related_semnatic2],				
				}

synonyms_document = {
'Beautiful':[attractive,pretty],
'Funny':[humorous,hilarious]
}
				
				
spelling_document = {
				'instrument':[instrumnet,instrumetn],
				'semantic':[sematic,semantec]
				}
				
				
#Use of synonyms				
text = 'She is Beautiful'
for word in text.split():
	if word in synonyms_document.keys():
		print('Following sentence could los mean')
		print(text)		
		for alternatives in synonyms_document [word]:
			print(text.replace(word,alternatives))