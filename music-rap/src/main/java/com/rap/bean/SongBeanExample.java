package com.rap.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class SongBeanExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SongBeanExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andSIdIsNull() {
            addCriterion("s_id is null");
            return (Criteria) this;
        }

        public Criteria andSIdIsNotNull() {
            addCriterion("s_id is not null");
            return (Criteria) this;
        }

        public Criteria andSIdEqualTo(Integer value) {
            addCriterion("s_id =", value, "sId");
            return (Criteria) this;
        }

        public Criteria andSIdNotEqualTo(Integer value) {
            addCriterion("s_id <>", value, "sId");
            return (Criteria) this;
        }

        public Criteria andSIdGreaterThan(Integer value) {
            addCriterion("s_id >", value, "sId");
            return (Criteria) this;
        }

        public Criteria andSIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("s_id >=", value, "sId");
            return (Criteria) this;
        }

        public Criteria andSIdLessThan(Integer value) {
            addCriterion("s_id <", value, "sId");
            return (Criteria) this;
        }

        public Criteria andSIdLessThanOrEqualTo(Integer value) {
            addCriterion("s_id <=", value, "sId");
            return (Criteria) this;
        }

        public Criteria andSIdIn(List<Integer> values) {
            addCriterion("s_id in", values, "sId");
            return (Criteria) this;
        }

        public Criteria andSIdNotIn(List<Integer> values) {
            addCriterion("s_id not in", values, "sId");
            return (Criteria) this;
        }

        public Criteria andSIdBetween(Integer value1, Integer value2) {
            addCriterion("s_id between", value1, value2, "sId");
            return (Criteria) this;
        }

        public Criteria andSIdNotBetween(Integer value1, Integer value2) {
            addCriterion("s_id not between", value1, value2, "sId");
            return (Criteria) this;
        }

        public Criteria andSNameIsNull() {
            addCriterion("s_name is null");
            return (Criteria) this;
        }

        public Criteria andSNameIsNotNull() {
            addCriterion("s_name is not null");
            return (Criteria) this;
        }

        public Criteria andSNameEqualTo(String value) {
            addCriterion("s_name =", value, "sName");
            return (Criteria) this;
        }

        public Criteria andSNameNotEqualTo(String value) {
            addCriterion("s_name <>", value, "sName");
            return (Criteria) this;
        }

        public Criteria andSNameGreaterThan(String value) {
            addCriterion("s_name >", value, "sName");
            return (Criteria) this;
        }

        public Criteria andSNameGreaterThanOrEqualTo(String value) {
            addCriterion("s_name >=", value, "sName");
            return (Criteria) this;
        }

        public Criteria andSNameLessThan(String value) {
            addCriterion("s_name <", value, "sName");
            return (Criteria) this;
        }

        public Criteria andSNameLessThanOrEqualTo(String value) {
            addCriterion("s_name <=", value, "sName");
            return (Criteria) this;
        }

        public Criteria andSNameLike(String value) {
            addCriterion("s_name like", value, "sName");
            return (Criteria) this;
        }

        public Criteria andSNameNotLike(String value) {
            addCriterion("s_name not like", value, "sName");
            return (Criteria) this;
        }

        public Criteria andSNameIn(List<String> values) {
            addCriterion("s_name in", values, "sName");
            return (Criteria) this;
        }

        public Criteria andSNameNotIn(List<String> values) {
            addCriterion("s_name not in", values, "sName");
            return (Criteria) this;
        }

        public Criteria andSNameBetween(String value1, String value2) {
            addCriterion("s_name between", value1, value2, "sName");
            return (Criteria) this;
        }

        public Criteria andSNameNotBetween(String value1, String value2) {
            addCriterion("s_name not between", value1, value2, "sName");
            return (Criteria) this;
        }

        public Criteria andSIntroIsNull() {
            addCriterion("s_intro is null");
            return (Criteria) this;
        }

        public Criteria andSIntroIsNotNull() {
            addCriterion("s_intro is not null");
            return (Criteria) this;
        }

        public Criteria andSIntroEqualTo(String value) {
            addCriterion("s_intro =", value, "sIntro");
            return (Criteria) this;
        }

        public Criteria andSIntroNotEqualTo(String value) {
            addCriterion("s_intro <>", value, "sIntro");
            return (Criteria) this;
        }

        public Criteria andSIntroGreaterThan(String value) {
            addCriterion("s_intro >", value, "sIntro");
            return (Criteria) this;
        }

        public Criteria andSIntroGreaterThanOrEqualTo(String value) {
            addCriterion("s_intro >=", value, "sIntro");
            return (Criteria) this;
        }

        public Criteria andSIntroLessThan(String value) {
            addCriterion("s_intro <", value, "sIntro");
            return (Criteria) this;
        }

        public Criteria andSIntroLessThanOrEqualTo(String value) {
            addCriterion("s_intro <=", value, "sIntro");
            return (Criteria) this;
        }

        public Criteria andSIntroLike(String value) {
            addCriterion("s_intro like", value, "sIntro");
            return (Criteria) this;
        }

        public Criteria andSIntroNotLike(String value) {
            addCriterion("s_intro not like", value, "sIntro");
            return (Criteria) this;
        }

        public Criteria andSIntroIn(List<String> values) {
            addCriterion("s_intro in", values, "sIntro");
            return (Criteria) this;
        }

        public Criteria andSIntroNotIn(List<String> values) {
            addCriterion("s_intro not in", values, "sIntro");
            return (Criteria) this;
        }

        public Criteria andSIntroBetween(String value1, String value2) {
            addCriterion("s_intro between", value1, value2, "sIntro");
            return (Criteria) this;
        }

        public Criteria andSIntroNotBetween(String value1, String value2) {
            addCriterion("s_intro not between", value1, value2, "sIntro");
            return (Criteria) this;
        }

        public Criteria andSIssuetimeIsNull() {
            addCriterion("s_issuetime is null");
            return (Criteria) this;
        }

        public Criteria andSIssuetimeIsNotNull() {
            addCriterion("s_issuetime is not null");
            return (Criteria) this;
        }

        public Criteria andSIssuetimeEqualTo(Date value) {
            addCriterionForJDBCDate("s_issuetime =", value, "sIssuetime");
            return (Criteria) this;
        }

        public Criteria andSIssuetimeNotEqualTo(Date value) {
            addCriterionForJDBCDate("s_issuetime <>", value, "sIssuetime");
            return (Criteria) this;
        }

        public Criteria andSIssuetimeGreaterThan(Date value) {
            addCriterionForJDBCDate("s_issuetime >", value, "sIssuetime");
            return (Criteria) this;
        }

        public Criteria andSIssuetimeGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("s_issuetime >=", value, "sIssuetime");
            return (Criteria) this;
        }

        public Criteria andSIssuetimeLessThan(Date value) {
            addCriterionForJDBCDate("s_issuetime <", value, "sIssuetime");
            return (Criteria) this;
        }

        public Criteria andSIssuetimeLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("s_issuetime <=", value, "sIssuetime");
            return (Criteria) this;
        }

        public Criteria andSIssuetimeIn(List<Date> values) {
            addCriterionForJDBCDate("s_issuetime in", values, "sIssuetime");
            return (Criteria) this;
        }

        public Criteria andSIssuetimeNotIn(List<Date> values) {
            addCriterionForJDBCDate("s_issuetime not in", values, "sIssuetime");
            return (Criteria) this;
        }

        public Criteria andSIssuetimeBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("s_issuetime between", value1, value2, "sIssuetime");
            return (Criteria) this;
        }

        public Criteria andSIssuetimeNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("s_issuetime not between", value1, value2, "sIssuetime");
            return (Criteria) this;
        }

        public Criteria andSUrlIsNull() {
            addCriterion("s_url is null");
            return (Criteria) this;
        }

        public Criteria andSUrlIsNotNull() {
            addCriterion("s_url is not null");
            return (Criteria) this;
        }

        public Criteria andSUrlEqualTo(String value) {
            addCriterion("s_url =", value, "sUrl");
            return (Criteria) this;
        }

        public Criteria andSUrlNotEqualTo(String value) {
            addCriterion("s_url <>", value, "sUrl");
            return (Criteria) this;
        }

        public Criteria andSUrlGreaterThan(String value) {
            addCriterion("s_url >", value, "sUrl");
            return (Criteria) this;
        }

        public Criteria andSUrlGreaterThanOrEqualTo(String value) {
            addCriterion("s_url >=", value, "sUrl");
            return (Criteria) this;
        }

        public Criteria andSUrlLessThan(String value) {
            addCriterion("s_url <", value, "sUrl");
            return (Criteria) this;
        }

        public Criteria andSUrlLessThanOrEqualTo(String value) {
            addCriterion("s_url <=", value, "sUrl");
            return (Criteria) this;
        }

        public Criteria andSUrlLike(String value) {
            addCriterion("s_url like", value, "sUrl");
            return (Criteria) this;
        }

        public Criteria andSUrlNotLike(String value) {
            addCriterion("s_url not like", value, "sUrl");
            return (Criteria) this;
        }

        public Criteria andSUrlIn(List<String> values) {
            addCriterion("s_url in", values, "sUrl");
            return (Criteria) this;
        }

        public Criteria andSUrlNotIn(List<String> values) {
            addCriterion("s_url not in", values, "sUrl");
            return (Criteria) this;
        }

        public Criteria andSUrlBetween(String value1, String value2) {
            addCriterion("s_url between", value1, value2, "sUrl");
            return (Criteria) this;
        }

        public Criteria andSUrlNotBetween(String value1, String value2) {
            addCriterion("s_url not between", value1, value2, "sUrl");
            return (Criteria) this;
        }

        public Criteria andSPlaytimeIsNull() {
            addCriterion("s_playtime is null");
            return (Criteria) this;
        }

        public Criteria andSPlaytimeIsNotNull() {
            addCriterion("s_playtime is not null");
            return (Criteria) this;
        }

        public Criteria andSPlaytimeEqualTo(String value) {
            addCriterion("s_playtime =", value, "sPlaytime");
            return (Criteria) this;
        }

        public Criteria andSPlaytimeNotEqualTo(String value) {
            addCriterion("s_playtime <>", value, "sPlaytime");
            return (Criteria) this;
        }

        public Criteria andSPlaytimeGreaterThan(String value) {
            addCriterion("s_playtime >", value, "sPlaytime");
            return (Criteria) this;
        }

        public Criteria andSPlaytimeGreaterThanOrEqualTo(String value) {
            addCriterion("s_playtime >=", value, "sPlaytime");
            return (Criteria) this;
        }

        public Criteria andSPlaytimeLessThan(String value) {
            addCriterion("s_playtime <", value, "sPlaytime");
            return (Criteria) this;
        }

        public Criteria andSPlaytimeLessThanOrEqualTo(String value) {
            addCriterion("s_playtime <=", value, "sPlaytime");
            return (Criteria) this;
        }

        public Criteria andSPlaytimeLike(String value) {
            addCriterion("s_playtime like", value, "sPlaytime");
            return (Criteria) this;
        }

        public Criteria andSPlaytimeNotLike(String value) {
            addCriterion("s_playtime not like", value, "sPlaytime");
            return (Criteria) this;
        }

        public Criteria andSPlaytimeIn(List<String> values) {
            addCriterion("s_playtime in", values, "sPlaytime");
            return (Criteria) this;
        }

        public Criteria andSPlaytimeNotIn(List<String> values) {
            addCriterion("s_playtime not in", values, "sPlaytime");
            return (Criteria) this;
        }

        public Criteria andSPlaytimeBetween(String value1, String value2) {
            addCriterion("s_playtime between", value1, value2, "sPlaytime");
            return (Criteria) this;
        }

        public Criteria andSPlaytimeNotBetween(String value1, String value2) {
            addCriterion("s_playtime not between", value1, value2, "sPlaytime");
            return (Criteria) this;
        }

        public Criteria andSDownloadIsNull() {
            addCriterion("s_download is null");
            return (Criteria) this;
        }

        public Criteria andSDownloadIsNotNull() {
            addCriterion("s_download is not null");
            return (Criteria) this;
        }

        public Criteria andSDownloadEqualTo(String value) {
            addCriterion("s_download =", value, "sDownload");
            return (Criteria) this;
        }

        public Criteria andSDownloadNotEqualTo(String value) {
            addCriterion("s_download <>", value, "sDownload");
            return (Criteria) this;
        }

        public Criteria andSDownloadGreaterThan(String value) {
            addCriterion("s_download >", value, "sDownload");
            return (Criteria) this;
        }

        public Criteria andSDownloadGreaterThanOrEqualTo(String value) {
            addCriterion("s_download >=", value, "sDownload");
            return (Criteria) this;
        }

        public Criteria andSDownloadLessThan(String value) {
            addCriterion("s_download <", value, "sDownload");
            return (Criteria) this;
        }

        public Criteria andSDownloadLessThanOrEqualTo(String value) {
            addCriterion("s_download <=", value, "sDownload");
            return (Criteria) this;
        }

        public Criteria andSDownloadLike(String value) {
            addCriterion("s_download like", value, "sDownload");
            return (Criteria) this;
        }

        public Criteria andSDownloadNotLike(String value) {
            addCriterion("s_download not like", value, "sDownload");
            return (Criteria) this;
        }

        public Criteria andSDownloadIn(List<String> values) {
            addCriterion("s_download in", values, "sDownload");
            return (Criteria) this;
        }

        public Criteria andSDownloadNotIn(List<String> values) {
            addCriterion("s_download not in", values, "sDownload");
            return (Criteria) this;
        }

        public Criteria andSDownloadBetween(String value1, String value2) {
            addCriterion("s_download between", value1, value2, "sDownload");
            return (Criteria) this;
        }

        public Criteria andSDownloadNotBetween(String value1, String value2) {
            addCriterion("s_download not between", value1, value2, "sDownload");
            return (Criteria) this;
        }

        public Criteria andSerNameIsNull() {
            addCriterion("ser_name is null");
            return (Criteria) this;
        }

        public Criteria andSerNameIsNotNull() {
            addCriterion("ser_name is not null");
            return (Criteria) this;
        }

        public Criteria andSerNameEqualTo(String value) {
            addCriterion("ser_name =", value, "serName");
            return (Criteria) this;
        }

        public Criteria andSerNameNotEqualTo(String value) {
            addCriterion("ser_name <>", value, "serName");
            return (Criteria) this;
        }

        public Criteria andSerNameGreaterThan(String value) {
            addCriterion("ser_name >", value, "serName");
            return (Criteria) this;
        }

        public Criteria andSerNameGreaterThanOrEqualTo(String value) {
            addCriterion("ser_name >=", value, "serName");
            return (Criteria) this;
        }

        public Criteria andSerNameLessThan(String value) {
            addCriterion("ser_name <", value, "serName");
            return (Criteria) this;
        }

        public Criteria andSerNameLessThanOrEqualTo(String value) {
            addCriterion("ser_name <=", value, "serName");
            return (Criteria) this;
        }

        public Criteria andSerNameLike(String value) {
            addCriterion("ser_name like", value, "serName");
            return (Criteria) this;
        }

        public Criteria andSerNameNotLike(String value) {
            addCriterion("ser_name not like", value, "serName");
            return (Criteria) this;
        }

        public Criteria andSerNameIn(List<String> values) {
            addCriterion("ser_name in", values, "serName");
            return (Criteria) this;
        }

        public Criteria andSerNameNotIn(List<String> values) {
            addCriterion("ser_name not in", values, "serName");
            return (Criteria) this;
        }

        public Criteria andSerNameBetween(String value1, String value2) {
            addCriterion("ser_name between", value1, value2, "serName");
            return (Criteria) this;
        }

        public Criteria andSerNameNotBetween(String value1, String value2) {
            addCriterion("ser_name not between", value1, value2, "serName");
            return (Criteria) this;
        }

        public Criteria andAlbmNameIsNull() {
            addCriterion("albm_name is null");
            return (Criteria) this;
        }

        public Criteria andAlbmNameIsNotNull() {
            addCriterion("albm_name is not null");
            return (Criteria) this;
        }

        public Criteria andAlbmNameEqualTo(String value) {
            addCriterion("albm_name =", value, "albmName");
            return (Criteria) this;
        }

        public Criteria andAlbmNameNotEqualTo(String value) {
            addCriterion("albm_name <>", value, "albmName");
            return (Criteria) this;
        }

        public Criteria andAlbmNameGreaterThan(String value) {
            addCriterion("albm_name >", value, "albmName");
            return (Criteria) this;
        }

        public Criteria andAlbmNameGreaterThanOrEqualTo(String value) {
            addCriterion("albm_name >=", value, "albmName");
            return (Criteria) this;
        }

        public Criteria andAlbmNameLessThan(String value) {
            addCriterion("albm_name <", value, "albmName");
            return (Criteria) this;
        }

        public Criteria andAlbmNameLessThanOrEqualTo(String value) {
            addCriterion("albm_name <=", value, "albmName");
            return (Criteria) this;
        }

        public Criteria andAlbmNameLike(String value) {
            addCriterion("albm_name like", value, "albmName");
            return (Criteria) this;
        }

        public Criteria andAlbmNameNotLike(String value) {
            addCriterion("albm_name not like", value, "albmName");
            return (Criteria) this;
        }

        public Criteria andAlbmNameIn(List<String> values) {
            addCriterion("albm_name in", values, "albmName");
            return (Criteria) this;
        }

        public Criteria andAlbmNameNotIn(List<String> values) {
            addCriterion("albm_name not in", values, "albmName");
            return (Criteria) this;
        }

        public Criteria andAlbmNameBetween(String value1, String value2) {
            addCriterion("albm_name between", value1, value2, "albmName");
            return (Criteria) this;
        }

        public Criteria andAlbmNameNotBetween(String value1, String value2) {
            addCriterion("albm_name not between", value1, value2, "albmName");
            return (Criteria) this;
        }

        public Criteria andCIdIsNull() {
            addCriterion("c_id is null");
            return (Criteria) this;
        }

        public Criteria andCIdIsNotNull() {
            addCriterion("c_id is not null");
            return (Criteria) this;
        }

        public Criteria andCIdEqualTo(Integer value) {
            addCriterion("c_id =", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdNotEqualTo(Integer value) {
            addCriterion("c_id <>", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdGreaterThan(Integer value) {
            addCriterion("c_id >", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("c_id >=", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdLessThan(Integer value) {
            addCriterion("c_id <", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdLessThanOrEqualTo(Integer value) {
            addCriterion("c_id <=", value, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdIn(List<Integer> values) {
            addCriterion("c_id in", values, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdNotIn(List<Integer> values) {
            addCriterion("c_id not in", values, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdBetween(Integer value1, Integer value2) {
            addCriterion("c_id between", value1, value2, "cId");
            return (Criteria) this;
        }

        public Criteria andCIdNotBetween(Integer value1, Integer value2) {
            addCriterion("c_id not between", value1, value2, "cId");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}