<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Main content -->
	<section class="content">
		<!-- /.row -->
		<div class="box box-body datagrid table-responsive no-padding"></div>
		<!-- /.box -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<script>
	var $url_module = "{$.php.base_url()~$class~'/'~$method}", $table = "{$table}", $bread = {$.php.json_encode($bread)};
	{* Toolbar Init *}
	var Toolbar_Init = {
		enable: true,
		toolbarBtn: ['btn-new','btn-copy','btn-refresh','btn-delete','btn-message','btn-print','btn-export','btn-import','btn-viewlog','btn-process'],
		disableBtn: ['btn-copy','btn-message','btn-print','btn-process'],
		hiddenBtn: ['btn-copy','btn-message'],
		processMenu: [{ id:"btn-process1", title:"Process 1" }, { id:"btn-process2", title:"Process 2" }, ],
		processMenuDisable: ['btn-process1'],
	};
	{* DataTable Init *}
	var DataTable_Init = {
		enable: true,
		tableWidth: '125%',
		act_menu: { copy: true, edit: true, delete: true },
		sub_menu: [
			{ pageid: 108, subKey: 'request_id', title: 'Request Line', },
		],
		columns: [
			{ width:"100px", orderable:true, data:"org_name", title:"Org Name" },
			{ width:"100px", orderable:true, data:"orgtrx_name", title:"Org Trx Name" },
			{ width:"100px", orderable:true, data:"bpartner_name", title:"Business Partner" },
			{ width:"100px", orderable:true, data:"residence", title:"Residence" },
			{ width:"100px", orderable:true, data:"doc_no", title:"Doc No" },
			{ width:"50px", orderable:true, className:"dt-head-center dt-body-center", data:"doc_date", title:"Doc Date" },
			{ width:"50px", orderable:true, className:"dt-head-center dt-body-center", data:"eta", title:"ETA" },
			{ width:"50px", orderable:true, className:"dt-head-center dt-body-center", data:"estimation_late", title:"Awaiting P/O (Days)", 
				render: function(data, type, row){ return parseInt(data) > 0 ? data : 0; },
				createdCell: function (td, cellData, rowData, row, col) { if ( parseInt(cellData) > 0 ) { $(td).css({ 'background-color':'red', 'font-weight':'bold' }); } },
			},
			{ width:"50px", orderable:true, className:"dt-head-center dt-body-center", data:"late", title:"Late (Days)", 
				render: function(data, type, row){ return parseInt(data) > 0 ? data : 0; },
				createdCell: function (td, cellData, rowData, row, col) { if ( parseInt(cellData) > 0 ) { $(td).css({ 'background-color':'red', 'font-weight':'bold' }); } },
			},
			{ width:"100px", orderable:false, data:"category_name", title:"Category" },	
			{ width:"250px", orderable:true, data:"description", title:"Description" },
		],
		order: ['id desc'],
	};
	
</script>
<script src="{$.const.ASSET_URL}js/window_view.js"></script>
