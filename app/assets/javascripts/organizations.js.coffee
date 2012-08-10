# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# $(document).ready ->
# 	 data = [ "Restaurant", "Bar", "Restaurant", "Azerbaijan", "Belarus", "Belgium", "Bosnia & Herzegovina", "Bulgaria", "Croatia", "Cyprus", "Czech Republic", "Denmark", "Estonia", "Finland", "France", "Georgia", "Germany", "Greece", "Hungary", "Iceland", "Ireland", "Italy", "Kosovo", "Latvia", "Liechtenstein", "Lithuania", "Luxembourg", "Macedonia", "Malta", "Moldova", "Monaco", "Montenegro", "Netherlands", "Norway", "Poland", "Portugal", "Romania", "Russia", "San Marino", "Serbia", "Slovakia", "Slovenia", "Spain", "Sweden", "Switzerland", "Turkey", "Ukraine", "United Kingdom", "Vatican City" ]
#   $("#organization_categories").kendoAutoComplete
#     dataSource: data
#     filter: "startswith"
#     placeholder: "Kategorie..."
#     separator: ", "

	# $(document).ready ->
	#   crudServiceBaseUrl = ""
	#   dataSource = new kendo.data.DataSource(
	#     transport:
	#       read:
	#         url: crudServiceBaseUrl + "/organizations"
	#         dataType: "json"
	# 
	#       update:
	#         url: crudServiceBaseUrl + "/organizations/update"
	#         dataType: "json"
	# 
	#       destroy:
	#         url: crudServiceBaseUrl + "/organizations/destroy"
	#         dataType: "json"
	# 
	#       create:
	#         url: crudServiceBaseUrl + "/organizations/create"
	#         dataType: "json"
	# 
	#       parameterMap: (options, operation) ->
	#         models: kendo.stringify(options.models)  if operation isnt "read" and options.models
	# 
	#     batch: true
	#     pageSize: 30
	#     schema:
	#       model:
	#         id: "id"
	#         fields:
	#           id:
	#             editable: false
	#             nullable: true
	# 
	#           name:
	#             type: "text"
	#             validation:
	#               required: true
	# 
	#           street:
	#             type: "text"
	#             validation:
	#               required: true
	# 
	#           postalcode:
	#             type: "text"
	# 
	#           city:
	#             type: "text"
	#             validation:
	#               required: true
	#   )
	#   $("#grid").kendoGrid
	#     dataSource: dataSource
	#     pageable: true
	#     height: 400
	#     toolbar: [ "create" ]
	#     columns: [
	#       field: "name"
	#       title: "Name"
	#     ,
	#       field: "street"
	#       title: "Street"
	#       width: "150px"
	#     ,
	#       field: "postalcode"
	#       title: "Postalcode"
	#       width: "150px"
	#     ,
	#       field: "city"
	#       title: "City"
	#       width: "100px"
	#     ,
	#       command: [ "edit", "destroy" ]
	#       title: "&nbsp;"
	#       width: "210px"
	#      ]
	#     editable: "popup"