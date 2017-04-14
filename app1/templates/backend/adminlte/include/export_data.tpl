   <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<script src="{$.const.ASSET_URL}js/export_data.js"></script>
<script src="{$.const.TEMPLATE_URL}plugins/bootstrap-validator/validator.min.js"></script>
<script src="{$.const.TEMPLATE_URL}plugins/shollu-combobox/js/shollu_cb.min.js"></script>
<script>
	{* Get Params *}
	var q = getURLParameter("q");
	var exp = getURLParameter("export");
	{* Start :: Init for Title, Breadcrumb *}
	var desc = function(x){ if (x) return "Export data"; };
	$(".content").before(BSHelper.PageHeader({ 
		title: "{$title}", 
		title_desc: desc(exp), 
		bc_list:[
			{ icon:"fa fa-dashboard", title:"Dashboard", link:"{$.const.APPS_LNK}" },
			{ icon:"", title:"{$title}", link:"javascript:history.back()" },
			{ icon:"", title: desc(exp), link:"" },
		]
	}));

	{* For design form interface *}
	var col = [], row = [];
	var form1 = BSHelper.Form({ autocomplete:"off" });	
	var box1 = BSHelper.Box({ type:"info" });
	col.push(BSHelper.Combobox({ label:"File Type", idname:"filetype", required: true, 
		list:[
			{ id:"xls", name:"Excel File (.xls)" },
			{ id:"pdf", name:"Acrobat File (.pdf)" },
			{ id:"csv", name:"Comma Separated Values File (.csv)" },
		] 
	}));
	col.push(BSHelper.Checkbox({ horz:false, label:"Compress The File (.zip)", idname:"is_compress", help:"Compress output file (xls/pdf/csv) to ZIP File (.zip)" }));
	form1.append(subRow(subCol(6, col)));
	form1.append(subRow(subCol()));
	col = [];
	col.push( BSHelper.Button({ type:"submit", label:"Submit", idname:"submit_btn" }) );
	col.push( '&nbsp;&nbsp;&nbsp;' );
	col.push( BSHelper.Button({ type:"button", label:"Cancel", cls:"btn-danger", idname:"btn_cancel", onclick:"window.history.back();" }) );
	form1.append( col );
	box1.find('.box-body').append(form1);
	$(".content").append(box1);

</script>