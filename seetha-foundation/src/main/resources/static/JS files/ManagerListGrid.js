var dataView;
var grid;
var columnFilters = {};

/*<![CDATA[*/
var data = /*[[${managerInfo}]]*/'A';

/*]]>*/
//var data= [{"managerZone":"tn47"}];
console.log(data);

/* set unique it to array */
var nextId = 1;
data.forEach(function(item) {
	// Generate a unique id using the nextId value
	var itemId = "item_" + nextId;

	// Set the id property of the item object
	item.id = itemId;

	// Increment the nextId value
	nextId++;
});
// Use the updated items array list with unique ids
console.log(data);
/* unique id end */
var options = {
	enableCellNavigation: true,
	showHeaderRow: true,
	headerRowHeight: 30,
	explicitInitialization: true
};
var columnFilters = {};

var columns = [{
	id: "managerCode",
	name: "Manager Code",
	field: "managerCode"
}, {
	id: "managerName",
	name: "Manager Name",
	field: "managerName"
}, {
	id: "managerPhoneNo",
	name: "Manager Phone No.",
	field: "managerPhoneNo"
}, {
	id: "managerAadhar",
	name: "Manager Aadhar No.",
	field: "managerAadhar"
}, {
	id: "managerMailId",
	name: "Manager MailId.",
	field: "managerMailId"
}, {
	id: "managerAddress",
	name: "Manager Address",
	field: "managerAddress"
}, {
	id: "managerZone",
	name: "Manager Zone",
	field: "managerZone"
}, {
	id: "managerAccount",
	name: "Manager Account",
	field: "managerAccount"
}];

/* filter start */
$(function() {
	function filter(item) {
		for (var columnId in columnFilters) {
			if (columnId !== undefined
				&& columnFilters[columnId] !== "") {
				var c = grid.getColumns()[grid.getColumnIndex(columnId)];
				if (item[c.field] != columnFilters[columnId]) {
					return false;
				}
			}
		}
		return true;
	}
	/* filter end */

	dataView = new Slick.Data.DataView();
	grid = new Slick.Grid("#myGrid", dataView, columns, options);

	/* filter start */
	dataView.onRowCountChanged.subscribe(function(e, args) {
		grid.updateRowCount();
		grid.render();
	});

	dataView.onRowsChanged.subscribe(function(e, args) {
		grid.invalidateRows(args.rows);
		grid.render();
	});

	$(grid.getHeaderRow()).delegate(":input", "change keyup",
		function(e) {
			var columnId = $(this).data("columnId");
			if (columnId != null) {
				columnFilters[columnId] = $.trim($(this).val());
				dataView.refresh();
			}
		});

	grid.onHeaderRowCellRendered.subscribe(function(e, args) {
		$(args.node).empty();
		$("<input type='text'>").data("columnId", args.column.id).val(
			columnFilters[args.column.id]).appendTo(args.node);
	});

	grid.init();

	dataView.beginUpdate();
	dataView.setItems(data);
	dataView.setFilter(filter);
	dataView.endUpdate();
})


