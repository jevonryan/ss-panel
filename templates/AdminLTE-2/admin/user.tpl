<{include file='admin/main.tpl'}>
    <!-- 加载dataTables样式文件 dataTables.bootstrap.css -->
    <link href="<{$resources_dir}>/asset/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                用户管理
                <small>User Manage</small>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body">
                            <table id="example1" class="table table-bordered table-striped">
                              <thead>
                                <tr>
                                   <th>ID</th>
                                    <th>用户名</th>
                                    <th>邮箱</th>
                                    <th>端口</th>
                                    <th>总流量</th>
                                    <th>剩余<br />流量</th>
                                    <th>已用<br />流量</th>
                                    <th>上传<br />流量</th>
                                    <th>下载<br />流量</th>
                                    <th>最后<br />签到</th>
                                    <th>注册<br />时间</th>
                                    <th>邀请人</th>
                                    <th>邀请码</th>
                                    <th>操作</th>
                                </tr>
                              </thead>
                              <tbody>
                                <{foreach $us as $rs}>
                                    <tr>
                                        <td><{$rs['uid']}></td>
                                        <td><{$rs['user_name']}></td>
                                        <td><{$rs['email']}></td>
                                        <td><{$rs['port']}></td>
                                        <td><{\Ss\Etc\Comm::flowAutoShow($rs['transfer_enable'])}></td>
                                        <td><{\Ss\Etc\Comm::flowAutoShow(($rs['transfer_enable']-$rs['u']-$rs['d']))}></td>
                                        <td><{\Ss\Etc\Comm::flowAutoShow(($rs['u']+$rs['d']))}></td>
                                        <td><{\Ss\Etc\Comm::flowAutoShow($rs['u'])}></td>
                                        <td><{\Ss\Etc\Comm::flowAutoShow($rs['d'])}></td>
                                        <td><{date('Y-m-d H:i:s',$rs['last_check_in_time'])}></td>
                                        <td><{$rs['reg_date']}></td>
                                        <td><{get_ref_name rs=$rs}></td><{* 调用自定义插件 传$rs['ref_by'] 然后返回数据 *}>
                                        <td><{$rs['invite_num']}></td>
                                        <td>
                                            <a class="btn btn-sm waves-effect waves-light" href="user_edit.php?uid=<{$rs['uid']}>">查看</a>
                                            <a class="btn btn-sm waves-effect waves-light red accent-4" href="user_del.php?uid=<{$rs['uid']}>" onclick="JavaScript:return confirm('确定删除吗？')">删除</a>
                                        </td>
                                    </tr>
                                <{/foreach}>
                              </tbody>
                            </table>
                        </div><!-- /.box-body -->
                    </div><!-- /.box -->
                </div>
            </div>

        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
<{include file='Public_javascript.tpl'}>
<!-- 在下面添加功能引用的js -->

<!-- 下面加载 dataTables 要用的 js 文件 -->
<script src="<{$resources_dir}>/asset/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
<script src="<{$resources_dir}>/asset/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript" src="<{$resources_dir}>/asset/plugins/datatables/file-size.js"></script>
<script type="text/javascript">
  $(function () {
    $("#example1").dataTable({
        columnDefs: [
           { type: 'file-size', targets: 4 },
           { type: 'file-size', targets: 5 },
           { type: 'file-size', targets: 6 },
           { type: 'file-size', targets: 7 },
           { type: 'file-size', targets: 8 }
        ]
        });
  });
</script>

<{include file='user/footer.tpl'}>