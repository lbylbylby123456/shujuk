package order.dao;

public class Order {
	//数据库字段
	private String id="";
	private String orderID;
	private String orderType;
	private String orderPrice;
	private String begin_time;
	private String userId;
	private String userRole;
	private String userConnect;
	private String create_time;
	private String end_time;
	private String orderUser;
    private String status;
	//传递条件查询用
	private String action;
	private String dbName;
    private String searchName="";
    private String search="";
	private String tableName="";
	private String type="";
	private String timeFrom="";
	private String timeTo="";
	private String timeSelect="";
	private String groupId="";
	private String groupSelect="";
	private String timeInterval="";
	private String statisticType="";
    private String sortIndex="null";
    private String orderBy="null";
	public Order() {

	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

    public String getSortIndex() {
        return sortIndex;
    }

    public void setSortIndex(String sortIndex) {
        this.sortIndex = sortIndex;
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }
    public String getSearchName() {
        return searchName;
    }

    public void setSearchName(String searchName) {
        this.searchName = searchName;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

	public String getorderType() {
		return orderType;
	}

	public void setorderType(String orderType) {
		this.orderType = orderType;
	}

	public String getorderUser() {
		return orderUser;
	}

	public void setorderUser(String orderUser) {
		this.orderUser = orderUser;
	}

	public String getorderPrice() {
		return orderPrice;
	}

	public void setorderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserConnect() {
		return userConnect;
	}

	public void setUserConnect(String userConnect) {
		this.userConnect = userConnect;
	}

	public String getCreateTime() {
		return create_time;
	}

	public void setCreateTime(String create_time) {
		this.create_time = create_time;
	}

	public String getEndTime() {
		return end_time;
	}

	public void setEndTime(String end_time) {
		this.end_time = end_time;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getorderID() {
		return orderID;
	}

	public void setorderID(String orderID) {
		this.orderID = orderID;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getDbName() {
		return dbName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}

	public String getBeginTime() {
		return begin_time;
	}

	public void setBeginTime(String begin_time) {
		this.begin_time = begin_time;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTimeFrom() {
		return timeFrom;
	}

	public void setTimeFrom(String timeFrom) {
		this.timeFrom = timeFrom;
	}

	public String getTimeTo() {
		return timeTo;
	}

	public void setTimeTo(String timeTo) {
		this.timeTo = timeTo;
	}

	public String getTimeSelect() {
		return timeSelect;
	}

	public void setTimeSelect(String timeSelect) {
		this.timeSelect = timeSelect;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getGroupSelect() {
		return groupSelect;
	}

	public void setGroupSelect(String groupSelect) {
		this.groupSelect = groupSelect;
	}

	public String getTimeInterval() {
		return timeInterval;
	}

	public void setTimeInterval(String timeInterval) {
		this.timeInterval = timeInterval;
	}

	public String getStatisticType() {
		return statisticType;
	}

	public void setStatisticType(String statisticType) {
		this.statisticType = statisticType;
	}

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
