/*!
 * FileInput Spanish (Latin American) Translations
 *
 * This file must be loaded after 'fileinput.js'. Patterns in braces '{}', or
 * any HTML markup tags in the messages must not be converted or translated.
 *
 * @see http://github.com/kartik-v/bootstrap-fileinput
 *
 * NOTE: this file must be saved in UTF-8 encoding.
 */
(function ($) {
    "use strict";
    $.fn.fileinput.locales.es = {
    		fileSingle: '单个文件',
            filePlural: '多个文件',
            browseLabel: '选择文件 &hellip;',
            removeLabel: '删除文件',
            removeTitle: '删除选中文件',
            cancelLabel: '取消',
            cancelTitle: '取消上传',
            uploadLabel: '上传',
            uploadTitle: '上传选中文件',
            msgSizeTooLarge: 'File "{name}" (<b>{size} KB</b>) exceeds maximum allowed upload size of <b>{maxSize} KB</b>. Please retry your upload!',
            msgFilesTooLess: '文件数量必须大于 <b>{n}</b> {files} ，请重新上传！',
            msgFilesTooMany: 'Number of files selected for upload <b>({n})</b> exceeds maximum allowed limit of <b>{m}</b>. Please retry your upload!',
            msgFileNotFound: '文件 "{name}" 未找到!',
            msgFileSecured: 'Security restrictions prevent reading the file "{name}".',
            msgFileNotReadable: 'File "{name}" is not readable.',
            msgFilePreviewAborted: 'File preview aborted for "{name}".',
            msgFilePreviewError: 'An error occurred while reading the file "{name}".',
            msgInvalidFileType: 'Invalid type for file "{name}". Only "{types}" files are supported.',
            msgInvalidFileExtension: 'Invalid extension for file "{name}". Only "{extensions}" files are supported.',
            msgValidationError: 'File Upload Error',
            msgLoading: 'Loading file {index} of {files} &hellip;',
            msgProgress: '加载第 {index} 文件 共 {files} - {name} - {percent}% 完成.',
            msgSelected: '选中{n}个文件',
            msgFoldersNotAllowed: '只支持拖拽文件! 跳过 {n} 拖拽的文件夹.',
            dropZoneTitle: '拖拽文件到这里 &hellip;<br>支持多文件同时上传;'
    };

    $.extend($.fn.fileinput.defaults, $.fn.fileinput.locales.es);
})(window.jQuery);
