<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>单位招聘</title>
    <link rel="stylesheet" href="${ctx}/resources/libs/${fontAwesome}/css/font-awesome.min.css" type="text/css">
    <!--[if IE 7]>
    <link rel="stylesheet" href="${ctx}/resources/libs/${fontAwesome}/css/font-awesome.min.css">
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/libs/${jqueryEasyui}/themes/metro-blue/easyui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/libs/${jqueryEasyui}/themes/icon.css">
    <link rel="stylesheet" href="${ctx}/resources/css/gxwlui.css">
    <link rel="stylesheet" href="${ctx}/resources/css/page.css">
</head>
<body>

<div class="g-layout">

    <div class="g-toolbar">
        <a onclick="baseInfo.add();" id="add" class="easyui-linkbutton toolbar g-button"><i
                class="fa fa-plus"></i>新增</a>
        <a onclick="baseInfo.edit();" id="edit" class="easyui-linkbutton toolbar g-button"><i class="fa fa-edit"></i>编辑</a>
        <a onclick="baseInfo.save();" id="save" class="easyui-linkbutton toolbar g-button"><i
                class="fa fa-floppy-o"></i>保存</a>
        <a onclick="baseInfo.del();" id="del" class="easyui-linkbutton toolbar g-button"><i class="fa fa-trash-o"></i>删除</a>
    </div>


    <div id="mainTab" class="easyui-tabs  g-container g-tabs1" data-options="fit:true,border:false">

        <div title="列表" style="position:relative;">
            <div id="query">
                <form id="queryForm" class="formCls" method="post">
                    <table class="g-form" cellpadding="0" cellspacing="0">
                        <tbody>
                        <tr>
                            <td class="form-cell-1">
                                <label class="form-label">单位名称</label>
                                <input name="q_unitsName_LIKE" class="easyui-validatebox form-control"/>
                            </td>
                            <td class="form-cell-1">
                                <label class="form-label">单位地址</label>
                                <input name="q_unitsAddr_LIKE" class="easyui-validatebox form-control"/></td>
                            <td class="form-cell-1">
                                <label class="form-label">招聘日期</label>
                                <input name="q_hiringTime_GTE_Date" class="easyui-datebox form-control"
                                       style="width:${comboboxWidth};height:${comboboxHeight}px"
                                       data-options="editable:false">
                            </td>
                            <td class="form-cell-1">
                                <label class="form-label"> ~ </label>
                                <input name="q_hiringTime_LTE_Date" class="easyui-datebox form-control"
                                       style="width:${comboboxWidth};height:${comboboxHeight}px"
                                       data-options="editable:false">
                            </td>
                        </tr>
                        <tr>
                            <td class="form-cell-1">
                                <label class="form-label">招聘类型</label>
                                <input dictCode="RecruitmentType" name="q_recruitmentType_EQ" class="easyui-combobox form-control"
                                       style="width:${comboboxWidth};height:${comboboxHeight}px"
                                       data-options="
                                            editable:false,
                                            panelHeight:'auto',
                                            valueField:'dictCode',
                                            textField:'dictName'">
                            </td>
                            <td class="form-cell-1">
                                <label class="form-label">有效日期</label>
                                <input name="q_validityDate_GTE_Date" class="easyui-datebox form-control"
                                       style="width:${comboboxWidth};height:${comboboxHeight}px"
                                       data-options="editable:false">
                            </td>
                            <td class="form-cell-1">
                                <label class="form-label"> ~ </label>
                                <input name="q_validityDate_LTE_Date" class="easyui-datebox form-control"
                                       style="width:${comboboxWidth};height:${comboboxHeight}px"
                                       data-options="editable:false">
                            </td>
                        </tr>
                        <tr>
                            <td class="form-cell-1"></td>
                            <td class="form-cell-1"></td>
                            <td class="form-cell-1"></td>
                            <td class="form-cell-1 f-button">
                                <a onclick="tableInfo.query();" class="easyui-linkbutton g-button"><i
                                        class="fa fa-search"></i>查询</a>
                                <a onclick="clearQueryForm('#queryForm');" class="easyui-linkbutton g-button"><i
                                        class="fa fa-reply"></i>重置</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>

            <div class="list-area" style="top:100px;">
                <table id="listGrid" style="height:100%"></table>
            </div>

        </div>

        <div id="minute" data-options="disabled:true" title="详细">

            <fieldset>
                <legend>单位招聘</legend>

                <form id="baseForm" action="">
                    <!-- 隐藏属性 -->
                    <input id="recruitmentId" name="recruitmentId" type="hidden"/>
                    <input id="createrId" name="createrId" type="hidden"/>
                    <input id="createTime" name="createTime" type="hidden"/>

                    <table class="g-form" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="form-cell-1">
                                <label class="form-label">所属机构</label>
                                <input id="meshId" name="meshId"/>
                            </td>
                            <td class="form-cell-1">
                                <label class="form-label">招聘单位名称</label>
                                <input required="required" class="easyui-validatebox form-control"
                                       name="unitsName"/>
                            </td>
                            <td class="form-cell-2" colspan="2">
                                <label class="form-label">单位地址</label>
                                <input name="unitsAddr" class="easyui-validatebox form-control"/>
                            </td>

                        </tr>

                        <tr>
                            <td class="form-cell-1">
                                <label class="form-label">编号</label>
                                <input name="code" class="easyui-validatebox form-control" >
                            </td>
                            <td class="form-cell-1">
                                <label class="form-label">联系电话</label>
                                <input name="linkPhone" class="easyui-validatebox form-control"/>
                            </td>
                            <td class="form-cell-1">
                                <label class="form-label">招聘类别</label>
                                <input dictCode="RecruitmentType" name="recruitmentType" class="easyui-combobox form-control"
                                       style="width:${comboboxWidth};height:${comboboxHeight}px"
                                       data-options="
                                            editable:false,
                                            panelHeight:'auto',
                                            valueField:'dictCode',
                                            textField:'dictName'">
                            </td>
                            <td class="form-cell-1">
                                <label title="招聘日期" class="form-label">招聘日期</label>
                                <input name="hiringTime" class="easyui-datebox form-control"
                                       style="width:${comboboxWidth};height:${comboboxHeight}px"
                                       data-options="required:true,editable:false">
                            </td>
                        </tr>

                        <tr>

                            <td class="form-cell-1">
                                <label class="form-label">有效日期</label>
                                <input name="validityDate" class="easyui-datebox form-control"
                                       style="width:${comboboxWidth};height:${comboboxHeight}px"
                                       data-options="required:true,editable:false">
                            </td>

                        </tr>

                        <tr>
                            <td class="form-cell-4" colspan="4">
                                <label class="form-label">单位简介</label>
                                <textarea name="unitIntro" class="easyui-validatebox form-control"
                                          rows="8"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-cell-4" colspan="4">
                                <label class="form-label">单位福利</label>
                                <textarea name="linkWelfare" class="easyui-validatebox form-control"
                                          rows="8"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-cell-4" colspan="4">
                                <label class="form-label">招工简介</label>
                                <textarea name="jobDescription" class="easyui-validatebox form-control"
                                          rows="15"></textarea>
                            </td>
                        </tr>
                    </table>
                </form>
            </fieldset>
        </div>
    </div>
</div>

<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/lookup.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/gxwl.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/public.js"></script>
<script type="text/javascript">

    var thisUiConfig = {
        main: window.main,
        ctx: "${ctx}",
        url: "recruitment",
        id: "#recruitmentId",    //表单中主键字段对应的控件的Id属性值
        idName: "recruitmentId",
        tableList: "#listGrid",
        getId: function () {
            var id = $(thisUiConfig.id).val();
            return id;
        }
    }

    $(function () {
        tabs.init();
        enableButtons(['add']);
        tableInfo.init();
        baseInfo.init();
        orgLookup();
        publicAttr.initCombobox();
    });


    var tabs = {

        isEdit: true,

        init: function () {

            $("#mainTab").tabs({
                onSelect: function (title, index) {
                    if (index == 0) { // 选中列表标签
                        $("#baseForm").form("clear");
                        if ($("#listGrid").datagrid("getSelections").length > 0) {
                            $("#mainTab").tabs("enableTab", 1);
                            enableButtons(["add", "del", "edit"]);
                        } else {
                            $("#mainTab").tabs("disableTab", 1);
                            enableButtons(["add"]);
                        }
                        tabs.isEdit = false;
                        setFormItemDisabled("#baseForm", true, null);
                    } else if (index == 1) { // 选中详细标签
                        loadData();
                        if (tabs.isEdit) {
                            setFormItemDisabled("#baseForm", false, null);
                            enableButtons(["add", "del", "save"]);
                        } else {
                            enableButtons(["add", "del", "edit"]);
                        }
                    }
                }
            });
        }

    }


    //基础信息初始化
    var baseInfo = {

        saveUrl: thisUiConfig.ctx + "/" + thisUiConfig.url + "/save",

        getUrl: thisUiConfig.ctx + "/" + thisUiConfig.url + "/get/",

        delUrl: thisUiConfig.ctx + "/" + thisUiConfig.url + "/del/",

        search: thisUiConfig.ctx + "/" + thisUiConfig.url + "/search ",

        init: function () {
            setFormItemDisabled("#baseForm", true, null);
        },

        save: function () {
            if ($("#baseForm").form("validate")) {
                var data = getFormData("#baseForm");
                if (data) {
                    publicFormControl.ajax({
                        type: "POST",
                        url: baseInfo.saveUrl,
                        data: data
                    }, function (result) {
                        var row = result.row;
                        $("#baseForm").form("load", row);
                        $("#meshId").lookup('setTxt', publicAttr.getOrgName(row.meshId));//添加名称
                        tableInfo.query();
                        enableButtons(["add", "save","del"]);
                    }, "show");

                }
            }

        },

        add: function () {
            tabs.isEdit = false;
            //clear data
            $("#listGrid").datagrid("unselectAll");
            $("#mainTab").tabs("enableTab", 1);
            $("#mainTab").tabs("select", 1);
            setFormItemDisabled("#baseForm", false, null);
            //$("#baseForm").form("enableValidation");
            enableButtons(["add", "save"]);
            $("#baseForm").form("clear");
            publicAttr.setDefaultsMesh("#meshId");
        },

        del: function () {
            var row = $("#listGrid").datagrid('getSelected');
            var id = $(thisUiConfig.id).val();
            if (!row) {
                if(!id){
                    $.messager.alert("温馨提示", "请选择删除的信息！", "info");
                    return;
                }
            }
            $.messager.confirm("温馨提示", "确定删除单位为【" + ($("input[name='unitsName']").val() || row.unitsName) + "】的记录?",
                    function (r) {
                        if (r) {
                            id = id || row[thisUiConfig.idName] ;
                            publicFormControl.ajax({
                                url: baseInfo.delUrl + id,
                                type: "POST"
                            }, function (data) {
                                if (data.resultCode == "0") {
                                    $("#baseForm").form("clear");
                                    $("#mainTab").tabs("select", 0);
                                    $("#mainTab").tabs("disableTab", 1);
                                    enableButtons(["add"]);
                                    tableInfo.query();
                                }
                            }, "show");
                        }
                    });

        },

        edit: function () {
            tabs.isEdit = true;
            var tab = $('#mainTab').tabs('getSelected');
            var index = $('#mainTab').tabs('getTabIndex', tab);
            if (index != 1) {
                $("#mainTab").tabs("enableTab", 1);
                $("#mainTab").tabs("select", 1);
            } else {
                enableButtons(["add", "del", "save"]);
            }
            setFormItemDisabled("#baseForm", false, null);
        }
    };

    function loadData() {
        var row = $(thisUiConfig.tableList).datagrid("getSelected");
        if (row) {
            var id = row[thisUiConfig.idName];
            if (id) {
                publicFormControl.ajax({
                    type: "POST",
                    url: baseInfo.getUrl + id,
                }, function (result) {
                    var row = result.row;
                    $("#baseForm").form("load", row);
                    $("#meshId").lookup('setTxt', publicAttr.getOrgName(row.meshId));//添加名称
                });

            }
        }
    }


    //列表加载
    var tableInfo = {

        //初始化列表
        init: function () {

            $("#listGrid").datagrid({
                rownumbers: true,
                singleSelect: true,
                autoRowHeight: false,
                border: false,
                pageSize: defaultPageSize,
                pageList: defaultPageList,
                pagination: true,
                queryParams: tableInfo.getQueryFormData("#queryForm"),
                url: thisUiConfig.ctx + "/" + thisUiConfig.url + "/search",
                columns: [[{
                    field: "cultivateId",
                    hidden: true,
                }, {
                    field: "meshId",
                    title: "所属机构",
                    width: 150,
                    align: 'left',
                    halign: 'center',
                    formatter: function (value, row, index) {

                        return publicAttr.getOrgName(value);
                    }
                }, {
                    field: "code",
                    title: "编号",
                    width: 80,
                    align: 'left',
                    halign: 'center'
                },{
                    field: "unitsName",
                    title: "单位名称",
                    width: 100,
                    align: 'left',
                    halign: 'center'
                }, {
                    field: "unitsAddr",
                    title: "单位地址",
                    width: 200,
                    align: 'left',
                    halign: 'center'
                }, {
                    field: "linkPhone",
                    title: "联系电话",
                    width: 100,
                    align: 'left',
                    halign: 'center'
                }, {
                    field: "hiringTime",
                    title: "招聘日期",
                    width: 100,
                    align: 'left',
                    halign: 'center'
                }, {
                    field: "validityDate",
                    title: "有效日期",
                    width: 100,
                    align: 'left',
                    halign: 'center'
                }, {
                    field: "recruitmentType",
                    title: "招聘类别",
                    width: 100,
                    align: 'left',
                    halign: 'center',
                    formatter: function (value, row, index) {

                        return publicAttr.getDictText("RecruitmentType",value)
                    }
                }]],

                onSelect: function (rowIndex, rowData) {
                    tabs.isEdit = false;
                    var len = $("#listGrid").datagrid("getSelections").length;
                    if (len == 1) {
                        $("#mainTab").tabs("enableTab", 1);
                        enableButtons(["add", "del", "edit"]);
                    } else if (len == 0) {
                        $("#mainTab").tabs("disableTab", 1);
                        enableButtons(["add"]);
                    } else {
                        enableButtons(["add", "del"]);
                        $("#mainTab").tabs("disableTab", 1);
                    }
                },
                onUnselect: function (rowIndex, rowData) {
                    var len = $("#listGrid").datagrid("getSelections").length;

                    if (len == 1) {
                        $("#mainTab").tabs("enableTab", 1);
                        enableButtons(["add", "del", "edit"]);
                    } else if (len == 0) {
                        enableButtons(["add"]);
                        $("#mainTab").tabs("disableTab", 1);
                    } else {
                        enableButtons(["add", "del"]);
                        $("#mainTab").tabs("disableTab", 1);
                    }
                },
                onDblClickRow:function (index,row) {
                    $("#mainTab").tabs("select",1);
                },
                onLoadSuccess: function (data) {
                    $("#listGrid").datagrid("unselectAll");
                }

            });

            // 设置分页显示形式
            $("#listGrid").datagrid("getPager").pagination({
                layout: defaultPageLayout
            });
        },

        query: function () {
            var param = tableInfo.getQueryFormData("#queryForm");
            enableButtons(["add"]);
            $("#listGrid").datagrid("load", param);
            $("#mainTab").tabs("disableTab", 1);
        },
        getQueryFormData: function (formId) {
            var meshIds = thisUiConfig.main.currentUserMesh.meshChildrenIds || "";
            var data = getFormData(formId) || {};
            if (meshIds) {
                data['q_meshId_IN'] = meshIds;
            }
            return data;
        }

    }


    function enableButtons(ids) {
        // 把所有按钮设置为不可用
        $(".easyui-linkbutton.toolbar").linkbutton("disable");
        $(".easyui-splitbutton.toolbar").linkbutton("disable");
        // 设置按钮可用
        for (var i = 0; i < ids.length; i++) {
            $("#" + ids[i]).linkbutton("enable");
        }
    }


    var orgLookup;
    /**
     * 机构弹出窗
     */
    function orgLookup() {

        orgLookup = $('#meshId').lookup({
            title: "选择所属网格",
            url: thisUiConfig.ctx + "/mesh/selectmesh",
            width: 350,
            height: 500,
            required: true,
            valueField: 'meshId',
            textField: 'meshName'
        });
    }


</script>

</body>
</html>