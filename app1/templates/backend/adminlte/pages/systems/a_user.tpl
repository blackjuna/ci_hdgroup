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
	var $url_module = "{$.php.base_url()~$class~'/'~$method}", $table = "{$table}", $title = "{$title}", $title_desc = "{$title_desc}";
	{* Toolbar Init *}
	var Toolbar_Init = {
		enable: true,
		toolbarBtn: ['btn-new','btn-copy','btn-refresh','btn-delete','btn-message','btn-print','btn-export','btn-import','btn-viewlog','btn-process'],
		disableBtn: ['btn-copy','btn-message','btn-print','btn-import'],
		hiddenBtn: ['btn-copy','btn-message','btn-print','btn-import'],
		processMenu: [{ id:"btn-process1", title:"Reset Login Attempt" }, ],
		processMenuDisable: [],
	};
	{* DataTable Init *}
	var DataTable_Init = {
		enable: true,
		aLBtn: { copy: true, edit: true, delete: true },
		aRBtn: [
			{ pageid: 31, subKey: 'user_id', title: 'Role', },
			{ pageid: 32, subKey: 'user_id', title: 'Org' },
			{ pageid: 33, subKey: 'user_id', title: 'Subs' },
		],
		aRBtn_width: '100px',
		order: ['is_online desc'],
		columns: [
			{ width:"130px", orderable:false, data:"name", title:"Name", render:function(data, type, row){ return ( row.is_online == '1' ? '<i class="fa fa-circle text-green" title="Online"></i>' : row.is_online == '2' ? '<i class="fa fa-circle text-gray" title="Idle"></i>' : '<i class="fa fa-circle text-red" title="Offline"></i>' )+' '+data; } },
			{ width:"150px", orderable:false, data:"email", title:"Email" },
			{ width:"250px", orderable:false, data:"description", title:"Description" },
			{ width:"40px", orderable:false, className:"dt-head-center dt-body-center", data:"is_active", title:"Active", render:function(data, type, row){ return (data=='1') ? 'Y' : 'N'; } },
			{ data:"is_online", "visible":false },
		],
	};
	
	{* btn-process1 in Toolbar *}
	$(document.body).click('button', function(e){
		{* switch($(e.target).attr('id')){ *}
		if ($(e.target).attr('id') == 'btn-process1'){
			var data = dataTable1.rows('.selected').data();
			
			if (data.count() < 1){
				BootstrapDialog.alert('Please chosed the record !');
				return false;
			}
			var ids = [];
			$.each(data, function(i){	ids[i] = data[i]['id'];	});

			var tblConfirm = BSHelper.Table({ data: data,	rowno: true, showheader: true, maxrows: 3, isConfirm: true, title: "<h4>Are you sure want to process this selected user/s ?</h4>" });
			BootstrapDialog.show({ title: 'Reset Login Attempt', type: BootstrapDialog.TYPE_DANGER, message: tblConfirm,
				buttons: [{
					icon: 'glyphicon glyphicon-send',
					cssClass: 'btn-danger',
					label: '&nbsp;&nbsp;Delete',
					action: function(dialog) {
						var button = this;
						button.spin();
						
						$.ajax({ url: '{$.php.base_url('systems/a_loginattempt')}', method: "OPTIONS", async: true, dataType: 'json',
							data: JSON.stringify({ loginattempt:1, id:ids.join() }),
							success: function(data) {
								dialog.close();
								dataTable1.ajax.reload( null, false );
								BootstrapDialog.alert(data.message);
							},
							error: function(data) {
								if (data.status==500){
									var message = data.statusText;
								} else {
									var error = JSON.parse(data.responseText);
									var message = error.message;
								}
								button.stopSpin();
								dialog.enableButtons(true);
								dialog.setClosable(true);
								BootstrapDialog.alert({ type:'modal-danger', title:'Notification', message:message });
							}
						});
					}
				}, {
						label: 'Close',
						action: function(dialog) { dialog.close(); }
				}],
				onshown: function(dialog) {
					{**}
				}
			});
		}
	});	

</script>
<script src="{$.const.ASSET_URL}js/window_view.js"></script>
