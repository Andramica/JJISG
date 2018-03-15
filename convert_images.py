import PIL.ExifTags
from PIL import Image
import os
import ntpath
import time
import logging
import sys
start_time = time.time()

def getFiles(directory):
    files_ = []
    for paths, dirnames, files in os.walk(directory):
        for f in files:
            files_.append(paths + '/' + f)
    return files_

FOLDER_DIRECTORY = 'C:/Users/apriasty/S3/dummy_data/'
ntpath.basename(FOLDER_DIRECTORY)
TEST_IMAGE_PATHS = getFiles(FOLDER_DIRECTORY)

def getImageFilename(path):
    head, tail = ntpath.split(path)
    return tail.split('.')[0]

def main():
    for image_path in TEST_IMAGE_PATHS:
        print("--- %s seconds ---" % (time.time() - start_time))
        try:
            print("start trying")
            image = Image.open(image_path)
            
            try: 
                exif = {
                    PIL.ExifTags.TAGS[k]: v
                    for k, v in image._getexif().items()
                    if k in PIL.ExifTags.TAGS
                }
                if exif['Orientation'] == 4:
                    image = image.rotate(180)
                elif exif['Orientation'] == 6:
                    image = image.rotate(270)
                elif exif['Orientation'] == 8:
                    image = image.rotate(90)
            # Exception when exif tags can't be retrieved
            except:
                print("No EXIF data")
                pass

            if (image.size[0] > 1000 and image.size[1] > 1000):
                basewidth = int(image.size[0] * 0.8)
                wpercent = (basewidth / float(image.size[0]))
                hsize = int((float(image.size[1]) * float(wpercent)))
                image = image.resize((basewidth, hsize))
            else:
                pass
            image = image.convert("P")
            image_filename = getImageFilename(image_path)
            image.save("C:/Users/apriasty/S3/converted_files/" + image_filename + ".png", format="PNG", optimize=True, quality=95)
            image.close()
            # Exception when image can't be opened
        except OSError:
            print("OSError")
            pass
        except:
            print("Unknow Error in image.open")
            pass
        
        
    print("--- %s seconds ---" % (time.time() - start_time))
    # function here


if __name__ == "__main__":
    main()
