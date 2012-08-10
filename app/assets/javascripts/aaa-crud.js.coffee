$(document).ready ->
  crudServiceBaseUrl = "/organizations"
  dataSource = new kendo.data.DataSource(
    transport:
      read:
        url: crudServiceBaseUrl + "/index.json"
        dataType: "json"

      update:
        url: crudServiceBaseUrl + "/update.json"
        dataType: "json"

      destroy:
        url: crudServiceBaseUrl + "/destroy.json"
        dataType: "json"

      create:
        url: crudServiceBaseUrl + "create.json"
        dataType: "json"

      parameterMap: (options, operation) ->
        models: kendo.stringify(options.models)  if operation isnt "read" and options.models

    batch: true
    pageSize: 30
    schema:
      model:
        id: "id"
        fields:
          id:
            editable: false
            nullable: true

          name:
            validation:
              required: true

  )
  $("#testgrid").kendoGrid
    dataSource: dataSource
    pageable: true
    height: 400
    toolbar: [ "create" ]
    columns: [
      field: "name"
      title: "Customer Name"   
    ,
      command: [ "edit", "destroy" ]
      title: "&nbsp;"
      width: "210px"
     ]
    editable: "popup"