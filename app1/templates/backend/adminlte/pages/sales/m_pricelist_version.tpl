<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Main content -->
	<section class="content">
		<!-- /.row -->
		<div class="box box-body table-responsive no-padding"></div>
		<!-- /.box -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<script>
	var $bread = {$.php.json_encode($bread)};
	var $url_module = "{$.php.base_url()~$class~'/'~$method}", $table = "{$table}", $title = "{$title}", $title_desc = "{$title_desc}", $is_submodule = "{$is_submodule}";
	{* Toolbar Init *}
	var Toolbar_Init = {
		enable: true,
		toolbarBtn: ['btn-new','btn-copy','btn-refresh','btn-delete','btn-message','btn-print','btn-export','btn-import','btn-viewlog','btn-process'],
		disableBtn: ['btn-copy','btn-message','btn-print','btn-import','btn-process'],
		hiddenBtn: ['btn-copy','btn-message','btn-print','btn-import'],
		processMenu: [{ id:"btn-process1", title:"btn-process1" }, ],
		processMenuDisable: [],
	};
	{* DataTable Init *}
	var DataTable_Init = {
		enable: true,
		submodule: true,
		aLBtn: { copy: true, edit: true, delete: true },
		aRBtn: [
			{ pageid: 52, subKey: 'pricelist_version_id', title: 'View Items', },
		],
		aRBtn_width: '100px',
		order: ['id desc'],
		columns: [
			{ width:"150px", orderable:false, data:"pricelist_name", title:"Price List" },
			{ width:"150px", orderable:false, data:"code_name", title:"Name" },
			{ width:"200px", orderable:false, data:"description", title:"Description" },
			{ width:"75px", orderable:false, className:"dt-head-center dt-body-center", data:"validfrom", title:"Valid From" },
			{ width:"40px", orderable:false, className:"dt-head-center dt-body-center", data:"is_active", title:"Active", render:function(data, type, row){ return (data=='1') ? 'Y' : 'N'; } },
		],
	};
		
</script>
<script src="{$.const.ASSET_URL}js/window_view.js"></script>
