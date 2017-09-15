<script src="resources/javascript/dropzone.js"></script>
<div class="col-md-9 inactivePanel" id="panelUploadFlowchart">
    <div id="subcontainer">
        <div class="panel panel-default">
            <div class="panel-heading clickedPanel-color">
                <h3 class="panel-title"><span><i class="fa fa-file-o"></i></span> Upload Flowchart</h3>
            </div>
            <div class="panel-body">
                <!-- Standard Form -->
                <form method="POST" enctype="multipart/form-data" id="uploadFlowchartsForm">
                	<input type="file" name="flowchartFiles[]" multiple/>
                	<input id="uploadFlowchartsBtn" type="submit" value="Upload"></button>
                </form>
            </div>
        </div>
    </div>
</div>

