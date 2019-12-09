package HM.dao;

public class Statistic{
	private int id;
	private String type;
	private String name;
	private String address;
	private String userId;
	private boolean timePeriodTag;
	private String timeFrom;
	private String timeTo;
	private boolean timeIntervalTag;
	private String timeInterval;
	private String creator;
	private String createTime;
	private String statisticType;
	
	private String addressId;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	public boolean isTimePeriodTag() {
		return timePeriodTag;
	}

	public void setTimePeriodTag(boolean timePeriodTag) {
		this.timePeriodTag = timePeriodTag;
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

	public boolean isTimeIntervalTag() {
		return timeIntervalTag;
	}

	public void setTimeIntervalTag(boolean timeIntervalTag) {
		this.timeIntervalTag = timeIntervalTag;
	}

	public String getTimeInterval() {
		return timeInterval;
	}

	public void setTimeInterval(String timeInterval) {
		this.timeInterval = timeInterval;
	}

	public Statistic() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getAddressId() {
		return addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}
	public String getStatisticType() {
		return statisticType;
	}

	public void setStatisticType(String statisticType) {
		this.statisticType = statisticType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}
