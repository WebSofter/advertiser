import os
import re
from transliterate import translit, get_available_language_codes

class Translit(object):
    @staticmethod
    def isEnglish(s):
        try:
            s.encode(encoding='utf-8').decode('ascii')
        except UnicodeDecodeError:
            return False
        else:
            return True

class FileUtils(object):
    @staticmethod
    def getTranslitedName(fileName):
        if not Translit.isEnglish(fileName):
            fileName = u'' + fileName.replace('"', '')
            fileName = translit(fileName, detect(fileName), reversed=True)
        return fileName
            
    @staticmethod
    def getFileIcon(fileName, iconType = None):
        exts = {
            'zip': {'icon' : 'file-archive', 'color' : 'text-warning'},
            'docx': {'icon' : 'file-word', 'color' : 'text-primary'},
            'doc': {'icon' : 'file-word', 'color' : 'text-primary'},
            'rtf': {'icon' : 'file-word', 'color' : 'text-primary'},
            'txt': {'icon' : 'file-alt', 'color' : 'text-dark'},
            'pdf': {'icon' : 'file-pdf', 'color' : 'text-danger'},
            'xlsx': {'icon' : 'file-excel', 'color' : 'text-success'},
            'xls': {'icon' : 'file-excel', 'color' : 'text-success'},
            'ppt': {'icon' : 'file-powerpoint', 'color' : 'text-danger'},
            'pptx': {'icon' : 'file-powerpoint', 'color' : 'text-danger'},
            'png': {'icon' : 'file-image', 'color' : 'text-info'},
            'jpg': {'icon' : 'file-image', 'color' : 'text-danger'},
            'gif': {'icon' : 'file-image', 'color' : 'text-success'},
            'mp4': {'icon' : 'file-video', 'color' : 'text-success'},
            '': {'icon' : 'file-alt', 'color' : 'text-secondary'} 
        }

        baseName = os.path.basename(fileName)  
        extensions = re.findall(r'\.([^.]+)', baseName)

        ext = ''
        if len(extensions) > 1:
            ext = extensions.pop()
        elif len(extensions) == 1:
            ext = extensions[0]

        return exts[ext]