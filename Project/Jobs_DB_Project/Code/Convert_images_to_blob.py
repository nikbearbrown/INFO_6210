import sys, os

def convertToBinaryData(filename):
    with open(filename, 'rb') as file:
        binaryData = file.read()
    return binaryData

direcotry_name = os.path.dirname(sys.argv[0])

l = []                          ## initialize few lists which we will later use
oid = 0                         #.
img_id = []                     #.
cat_img_name =[]                #.
img_type = []                   #.
img_res = []                    #.
img_name = []                   #.
img_size = []                   #.
blob_data = []                  #.
x = []                          #.
y = []                          #.
z = []                          ##


img_res_val = "960x540"
img_type_val  = "png"
for subdir, dirs, files in os.walk(direcotry_name):
    for file in files:
        filepath = subdir + os.sep + file
        cat_img = filepath.replace(subdir, "")

        cat_img_name.append(cat_img)

        img_res.append(img_res_val)

        img_type.append(img_type_val)

        img_name.append(cat_img.replace(".png",""))

        img_size.append(os.path.getsize(filepath))

        blob_data.append(convertToBinaryData(filepath))

        e = re.findall("X\d+.", filepath)                       # find the x degree using regex
        qewg=e[0].replace("X","").replace("_", "")
        x.append(qewg)

        e = re.findall("Y\d+.", filepath)                       # find the y degree using regex
        qewg=e[0].replace("Y","").replace("_", "")
        y.append(qewg)

        e = re.findall("Z\d+.", filepath)                       # find the z degree using regex
        qewg=e[0].replace("Z","").replace("_", "")
        z.append(qewg)

        oid = oid + 1
        #print(oid)
        img_id.append(oid)



data = {
    "image_id"  : img_id,
    "image_name": img_name,
    "image_size": img_size,
    "image_reso": img_res,                              # create a data dictonary with all the lists
    "image_type": img_type,
    "image_BLOB": blob_data,
    "X"         : x,
    "Y"         : y,
    "Z"         : z,

}

import pandas as pd
dataFrame = pd.DataFrame(data)                                  # convert data dictonary into a dataframe

dataFrame.to_csv('final.csv',encoding='utf-8')                  # export the dataFrame into a csv
