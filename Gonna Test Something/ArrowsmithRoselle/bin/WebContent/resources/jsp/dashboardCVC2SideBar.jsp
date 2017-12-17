<div class="col-md-3" id="dashboardSideBar">
  <div class="list-group">
    <a href="#" class="list-group-item active sideBar-cell-color" onclick="clickSideBar(this.id)" id="dashboardNav"><span><i class="fa fa-dashboard"></i></span> Dashboard
    </a>
    <a href="#" class="list-group-item" onclick="clickSideBar(this.id)" id="messagesNav"><span><i class="fa fa-envelope"></i></span> Messages <!--<span class="badge">12</span>--></a>
    <a href="#" class="list-group-item" data-toggle="modal" data-target="#setNewOfferingsModal" data-backdrop="static" data-keyboard="false" id="addOfferingsNav"><span><i class="fa fa-calendar-plus-o"></i></span> Add New Offerings <!--<span class="badge">33</span>--></a>
  	<a href="#" class="list-group-item" onclick="clickViewOfferingsCVC(this.id)" id="viewOfferingsCVCNav"><span><i class="fa fa-star"></i></span> Faculty Assignment<!--<span class="badge">33</span>--></a>
	<a href="#" class="list-group-item" onclick="clickDeloadOfferings(this.id)" id="viewDeloadingsCVCNav"><span><i class="fa fa-thumb-tack"></i></span> Deloadings<!--<span class="badge">33</span>--></a>	  	<!-- YOU CANNOT HAVE AN EMPTY #. NAG EERROR PUTANGINA KAPAG WALA. -->
  </div>
</div>