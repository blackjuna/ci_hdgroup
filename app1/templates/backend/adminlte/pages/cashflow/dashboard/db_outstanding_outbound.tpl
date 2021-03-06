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
			{ pageid: 189, subKey: 'movement_id', title: 'Outbound Line', },
		],
		order: ['id desc'],
		columns: [
			{ width:"100px", orderable:true, data:"org_name", title:"From Org Name" },
			{ width:"100px", orderable:true, data:"orgtrx_name", title:"From OrgTrx Name" },
			{ width:"100px", orderable:true, data:"org_to_name", title:"To Org Name" },
			{ width:"100px", orderable:true, data:"orgtrx_to_name", title:"To OrgTrx Name" },
			{ width:"100px", orderable:true, data:"doc_no", title:"Doc No" },
			{ width:"50px", orderable:true, className:"dt-head-center dt-body-center", data:"doc_date", title:"Doc Date" },
			{ width:"100px", orderable:true, data:"doc_no_request", title:"Req Doc No" },
			{ width:"60px", orderable:true, className:"dt-head-center dt-body-center", data:"doc_date_request", title:"Req Doc Date" },
			{ width:"50px", orderable:true, className:"dt-head-center dt-body-center", data:"eta_request", title:"Req ETA" },
			{ width:"50px", orderable:true, className:"dt-head-center dt-body-center", data:"late", title:"Awaiting Inbound (Days)", 
				render: function(data, type, row){ return parseInt(data) > 0 ? data : 0; },
				createdCell: function (td, cellData, rowData, row, col) { if ( parseInt(cellData) > 0 ) { $(td).css({ 'background-color':'red', 'font-weight':'bold' }); } },
			},
			{ width:"100px", orderable:false, data:"category_name", title:"Category" },
			{ width:"250px", orderable:true, data:"description", title:"Description" },

		],
	};
	
</script>
<script src="{$.const.ASSET_URL}js/window_view.js"></script>
