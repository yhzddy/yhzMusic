package com.rap.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class CommentBeanExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CommentBeanExample() {
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

        public Criteria andCmtIdIsNull() {
            addCriterion("cmt_id is null");
            return (Criteria) this;
        }

        public Criteria andCmtIdIsNotNull() {
            addCriterion("cmt_id is not null");
            return (Criteria) this;
        }

        public Criteria andCmtIdEqualTo(Integer value) {
            addCriterion("cmt_id =", value, "cmtId");
            return (Criteria) this;
        }

        public Criteria andCmtIdNotEqualTo(Integer value) {
            addCriterion("cmt_id <>", value, "cmtId");
            return (Criteria) this;
        }

        public Criteria andCmtIdGreaterThan(Integer value) {
            addCriterion("cmt_id >", value, "cmtId");
            return (Criteria) this;
        }

        public Criteria andCmtIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("cmt_id >=", value, "cmtId");
            return (Criteria) this;
        }

        public Criteria andCmtIdLessThan(Integer value) {
            addCriterion("cmt_id <", value, "cmtId");
            return (Criteria) this;
        }

        public Criteria andCmtIdLessThanOrEqualTo(Integer value) {
            addCriterion("cmt_id <=", value, "cmtId");
            return (Criteria) this;
        }

        public Criteria andCmtIdIn(List<Integer> values) {
            addCriterion("cmt_id in", values, "cmtId");
            return (Criteria) this;
        }

        public Criteria andCmtIdNotIn(List<Integer> values) {
            addCriterion("cmt_id not in", values, "cmtId");
            return (Criteria) this;
        }

        public Criteria andCmtIdBetween(Integer value1, Integer value2) {
            addCriterion("cmt_id between", value1, value2, "cmtId");
            return (Criteria) this;
        }

        public Criteria andCmtIdNotBetween(Integer value1, Integer value2) {
            addCriterion("cmt_id not between", value1, value2, "cmtId");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(Integer value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(Integer value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(Integer value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(Integer value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(Integer value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<Integer> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<Integer> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(Integer value1, Integer value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(Integer value1, Integer value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andSongIdIsNull() {
            addCriterion("song_id is null");
            return (Criteria) this;
        }

        public Criteria andSongIdIsNotNull() {
            addCriterion("song_id is not null");
            return (Criteria) this;
        }

        public Criteria andSongIdEqualTo(Integer value) {
            addCriterion("song_id =", value, "songId");
            return (Criteria) this;
        }

        public Criteria andSongIdNotEqualTo(Integer value) {
            addCriterion("song_id <>", value, "songId");
            return (Criteria) this;
        }

        public Criteria andSongIdGreaterThan(Integer value) {
            addCriterion("song_id >", value, "songId");
            return (Criteria) this;
        }

        public Criteria andSongIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("song_id >=", value, "songId");
            return (Criteria) this;
        }

        public Criteria andSongIdLessThan(Integer value) {
            addCriterion("song_id <", value, "songId");
            return (Criteria) this;
        }

        public Criteria andSongIdLessThanOrEqualTo(Integer value) {
            addCriterion("song_id <=", value, "songId");
            return (Criteria) this;
        }

        public Criteria andSongIdIn(List<Integer> values) {
            addCriterion("song_id in", values, "songId");
            return (Criteria) this;
        }

        public Criteria andSongIdNotIn(List<Integer> values) {
            addCriterion("song_id not in", values, "songId");
            return (Criteria) this;
        }

        public Criteria andSongIdBetween(Integer value1, Integer value2) {
            addCriterion("song_id between", value1, value2, "songId");
            return (Criteria) this;
        }

        public Criteria andSongIdNotBetween(Integer value1, Integer value2) {
            addCriterion("song_id not between", value1, value2, "songId");
            return (Criteria) this;
        }

        public Criteria andCmtContentIsNull() {
            addCriterion("cmt_content is null");
            return (Criteria) this;
        }

        public Criteria andCmtContentIsNotNull() {
            addCriterion("cmt_content is not null");
            return (Criteria) this;
        }

        public Criteria andCmtContentEqualTo(String value) {
            addCriterion("cmt_content =", value, "cmtContent");
            return (Criteria) this;
        }

        public Criteria andCmtContentNotEqualTo(String value) {
            addCriterion("cmt_content <>", value, "cmtContent");
            return (Criteria) this;
        }

        public Criteria andCmtContentGreaterThan(String value) {
            addCriterion("cmt_content >", value, "cmtContent");
            return (Criteria) this;
        }

        public Criteria andCmtContentGreaterThanOrEqualTo(String value) {
            addCriterion("cmt_content >=", value, "cmtContent");
            return (Criteria) this;
        }

        public Criteria andCmtContentLessThan(String value) {
            addCriterion("cmt_content <", value, "cmtContent");
            return (Criteria) this;
        }

        public Criteria andCmtContentLessThanOrEqualTo(String value) {
            addCriterion("cmt_content <=", value, "cmtContent");
            return (Criteria) this;
        }

        public Criteria andCmtContentLike(String value) {
            addCriterion("cmt_content like", value, "cmtContent");
            return (Criteria) this;
        }

        public Criteria andCmtContentNotLike(String value) {
            addCriterion("cmt_content not like", value, "cmtContent");
            return (Criteria) this;
        }

        public Criteria andCmtContentIn(List<String> values) {
            addCriterion("cmt_content in", values, "cmtContent");
            return (Criteria) this;
        }

        public Criteria andCmtContentNotIn(List<String> values) {
            addCriterion("cmt_content not in", values, "cmtContent");
            return (Criteria) this;
        }

        public Criteria andCmtContentBetween(String value1, String value2) {
            addCriterion("cmt_content between", value1, value2, "cmtContent");
            return (Criteria) this;
        }

        public Criteria andCmtContentNotBetween(String value1, String value2) {
            addCriterion("cmt_content not between", value1, value2, "cmtContent");
            return (Criteria) this;
        }

        public Criteria andCmtDateIsNull() {
            addCriterion("cmt_date is null");
            return (Criteria) this;
        }

        public Criteria andCmtDateIsNotNull() {
            addCriterion("cmt_date is not null");
            return (Criteria) this;
        }

        public Criteria andCmtDateEqualTo(Date value) {
            addCriterionForJDBCDate("cmt_date =", value, "cmtDate");
            return (Criteria) this;
        }

        public Criteria andCmtDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("cmt_date <>", value, "cmtDate");
            return (Criteria) this;
        }

        public Criteria andCmtDateGreaterThan(Date value) {
            addCriterionForJDBCDate("cmt_date >", value, "cmtDate");
            return (Criteria) this;
        }

        public Criteria andCmtDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("cmt_date >=", value, "cmtDate");
            return (Criteria) this;
        }

        public Criteria andCmtDateLessThan(Date value) {
            addCriterionForJDBCDate("cmt_date <", value, "cmtDate");
            return (Criteria) this;
        }

        public Criteria andCmtDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("cmt_date <=", value, "cmtDate");
            return (Criteria) this;
        }

        public Criteria andCmtDateIn(List<Date> values) {
            addCriterionForJDBCDate("cmt_date in", values, "cmtDate");
            return (Criteria) this;
        }

        public Criteria andCmtDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("cmt_date not in", values, "cmtDate");
            return (Criteria) this;
        }

        public Criteria andCmtDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("cmt_date between", value1, value2, "cmtDate");
            return (Criteria) this;
        }

        public Criteria andCmtDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("cmt_date not between", value1, value2, "cmtDate");
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