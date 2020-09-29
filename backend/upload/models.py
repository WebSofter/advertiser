from django.db import models
from datetime import datetime
from transliterate import translit, get_available_language_codes
from langdetect import detect
from .utils import FileUtils
#from .models import File
'''
def isEnglish(s):
    try:
        s.encode(encoding='utf-8').decode('ascii')
    except UnicodeDecodeError:
        return False
    else:
        return True
'''
# Create your models here.

def file_directory_path(instance, filename): 
    currentDate = datetime.now()
    formatedDate = currentDate.strftime('%Y/%m/%d')#("%Y-%m-%d %H:%M:%S")
    #print(detect(filename), filename)
    '''
    if not isEnglish(filename):
        filename = u'' + filename.replace('"', '')
        filename = translit(filename, detect(filename), reversed=True)
    '''
    filename = FileUtils.getTranslitedName(filename)
    return ('file/' + formatedDate + '/{0}/').format(filename) 

#translit(u"Лорем ипсум долор сит амет", reversed=True)

class File(models.Model):

    file = models.FileField(blank=False, null=True, upload_to =file_directory_path)
    STATUSES = (
        (0, 'Deleted'),
        (1, 'Active'),
    )
    status = models.IntegerField(verbose_name='Status', choices=STATUSES, default=1)
    def __str__(self):
        return self.file.name