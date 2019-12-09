package album.dao;

public class Album {
    //数据库字段
    private String id;
    private String album_id;
    private String album_info;
    private String create_time;
    private String userID;
    private String sortIndex="null";
    private String orderBy="null";
    private String path="";
    //传递条件查询用
    private String action;
    private String search="null";
    private String dbName;
    private String timeFrom="";
    private String timeTo="";
    private String tableName="";
    public String getPath() {
        return path;
    }
    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }
    public void setPath(String path) {
        this.path = path;
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
    public String getTableName() {
        return tableName;
    }
    public void setTableName(String tableName) {
        this.tableName = tableName;
    }
    public Album() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDbName() {
        return dbName;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getCreatetime() {
        return create_time;
    }

    public void setCreatetime(String create_time) {
        this.create_time = create_time;
    }

    public String getAlbuminfo() {
        return album_info;
    }

    public void setAlbuminfo(String album_info) {
        this.album_info = album_info;
    }

    public String getAlbumid() {
        return album_id;
    }

    public void setAlbumid(String album_id) {
        this.album_id = album_id;
    }
}
