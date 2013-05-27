$.expr[":"].contains = $.expr.createPseudo(function(arg) {
    return function( elem ) {
        return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
    };
});
function Filter(list, inputsel, valsel) {
    this.el = list;
    var self = this;
    $(inputsel).change(function () {
        var filter = $(this).val();
        if(filter) {
            $(self.el).find(valsel+':not(:contains(' + filter + '))').parent().hide();
            $(self.el).find(valsel+':contains(' + filter + ')').parent().show();
        } else {
            $(self.el).find('li').show();
        }
        return false;
    })
    .keyup( function () { $(this).change(); });
    return this;
}
