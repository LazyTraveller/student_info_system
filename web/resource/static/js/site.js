// 重置表单
function resetForm(elem) {
    $(elem).parents('form')[0].reset();
}

// 格式化时间
function formatDate(date, format) {
    if(date == null) {
        return '';
    }
    if (!window.moment) {
        throw new Error('请确保引用了moment.js!');
    }
    var f = format || ('YYYY-MM-DD HH:mm:ss');
    return window.moment(date).format(f);
}

// 填充表单数据
function fillFormData(formId, data) {
    for (var propName in data) {
        console.log('#' + formId + ' [name="' + propName + '"]')
        $('#' + formId + ' [name="' + propName + '"]').val(data[propName]);
    }
}

// 定义一个匿名函数并执行，传递的参数是jQuery对象
(function($){
    // 给jQuery新增功能函数，用以序列化表单
    $.fn.serializeObject = function() {
        var obj = {};
        var arr = this.serializeArray();
        $.each(arr, function() {
            if(obj[this.name] !== undefined) { // 此表单项有多个值，如复选框
                if((obj[this.name] instanceof Array) === false) {  // 如果不是数组，则转为数组
                    obj[this.name] = [obj[this.name]];
                }
                obj[this.name].push(this.value || '');
            } else {
                obj[this.name] = this.value || '';
            }
        });
        return obj;
    };
})(jQuery);





