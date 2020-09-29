var path = require('path')
import axios from 'axios'
import conf from './configuration'

const util = {

}


util.fileNameLimit = function(fileName){
    let ext = fileName.includes('.') ? '.' + fileName.split('.')[fileName.split('.').length - 1] : ''
    let baseName = fileName.substr(0, fileName.lastIndexOf("."))
    if(baseName.length > 10)
      fileName = baseName.substr(0,10) + "..." + baseName.substr(-5) + ext
    else fileName = baseName + ext
  
    return fileName
  }
util.goToLink = function(link, target = '_blank'){
    window.open(link, target).focus()
}
util.getFileInfo = function(fileName){
    let file = {}
    let ext = null
    let name = path.basename(fileName)
    try{
      ext = (/[.]/.exec(fileName))[0] ? /[^.]+$/.exec(fileName)[0] : undefined
    }catch(err){
      console.log(err)
    }
    
    switch(ext){
        case 'zip': file = {name, icon : 'file-archive', color : 'text-warning'}
            break;
        case 'docx': file = {name, icon : 'file-word', color : 'text-primary'}
            break;
        case 'doc': file = {name, icon : 'file-word', color : 'text-primary'}
            break;
        case 'rtf': file = {name, icon : 'file-word', color : 'text-primary'}
            break;
        case 'txt': file = {name, icon : 'file-alt', color : 'text-dark'}
            break;
        case 'pdf': file = {name, icon : 'file-pdf', color : 'text-danger'}
            break;
        case 'xlsx': file = {name, icon : 'file-excel', color : 'text-success'}
            break;
        case 'xls': file = {name, icon : 'file-excel', color : 'text-success'}
            break;
        case 'ppt': file = {name, icon : 'file-powerpoint', color : 'text-danger'}
            break;
        case 'pptx': file = {name, icon : 'file-powerpoint', color : 'text-danger'}
            break;
        case 'png': file = {name, icon : 'file-image', color : 'text-info'}
            break;
        case 'jpg': file = {name, icon : 'file-image', color : 'text-danger'}
            break;
        case 'gif': file = {name, icon : 'file-image', color : 'text-success'}
            break;
        case 'mp4': file = {name, icon : 'file-video', color : 'text-success'}
            break;
        default:
            file = {name, icon : 'file-alt', color : 'text-secondary'}
    }
    return file
}
util.downloadFile = function(link, name){
    axios.get(link, {responseType: 'arraybuffer'}).then(res=>{
        let blob = new Blob([res.data], {type:'application/*'})
        let link = document.createElement('a')
        link.href = window.URL.createObjectURL(blob)
        link.download = name
        link._target = 'blank'
        link.click();
      })
}
util.getPageCursor = function(currentPage, perPage, totalRows){
    return `Showing ${ currentPage * perPage - perPage + 1 } to ${ (perPage * currentPage > totalRows) ? (perPage * (currentPage-1) + perPage * currentPage % totalRows  + 1)  : (perPage * currentPage) } of ${totalRows} entries`
}

util.scrollToEnd = function(self, ref, time = 1500){
    setTimeout(()=> {
        let container = self.$refs[ref]
        container.scrollTop = container.scrollHeight
    }, time)
}

util.getImageUrl = function(url){
    return url === undefined ? null : url.includes('http') ? url : conf.url + url
}

export default util