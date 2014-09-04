//= require plugins/flatty/datatables/jquery.dataTables.min.js
//= require plugins/flatty/datatables/jquery.dataTables.columnFilter.js
//= require plugins/flatty/datatables/dataTables.overrides.js

this.setDataTable = function(selector) {
    return selector.each(function(i, elem) {
        var dt, sdom;
        if ($(elem).data("pagination-top-bottom") === true) {
            sdom = "<'row datatables-top'<'col-sm-6'l><'col-sm-6 text-right'pf>r>t<'row datatables-bottom'<'col-sm-6'i><'col-sm-6 text-right'p>>";
        } else if ($(elem).data("pagination-top") === true) {
            sdom = "<'row datatables-top'<'col-sm-6'l><'col-sm-6 text-right'pf>r>t<'row datatables-bottom'<'col-sm-6'i><'col-sm-6 text-right'>>";
        } else {
            sdom = "<'row datatables-top'<'col-sm-6'l><'col-sm-6 text-right'f>r>t<'row datatables-bottom'<'col-sm-6'i><'col-sm-6 text-right'p>>";
        }
        dt = $(elem).dataTable({
            sDom: sdom,
            sPaginationType: "bootstrap",
            "iDisplayLength": $(elem).data("pagination-records") || 10,
            oLanguage: {
                sLengthMenu: "_MENU_ records per page"
            }
        });
        if ($(elem).hasClass("data-table-column-filter")) {
            dt.columnFilter();
        }
        dt.closest('.dataTables_wrapper').find('div[id$=_filter] input').css("width", "200px");
        return dt.closest('.dataTables_wrapper').find('input').addClass("form-control input-sm").attr('placeholder', 'Search');
    });
};

(function(){
    setDataTable($('.data-table'));

    $('body').on('change', 'input[type=file]', function(){
        if (this.files && this.files[0]) {
            var inputElement = $(this);
            var fileReader = new FileReader();
            fileReader.onload = function(e) {
                inputElement.closest('.image-preview-box').find('img').attr('src', e.target.result);
            };
            fileReader.readAsDataURL(this.files[0]);
        }
    });
})();