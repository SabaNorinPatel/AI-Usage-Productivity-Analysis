-- 1. Which AI tools are most popular among users?
SELECT
    AI_Tool,
    COUNT(*) AS total_users
FROM ai_usage
GROUP BY AI_Tool
ORDER BY total_users DESC;


-- 2. Which professions and AI tools generate the highest average time savings per week?
SELECT
    Profession,
    AI_Tool,
    ROUND(AVG(Time_Saved_Hours_Per_Week), 2) AS avg_hours_saved_per_week
FROM ai_usage
GROUP BY Profession, AI_Tool
ORDER BY avg_hours_saved_per_week DESC;


-- 3. Does increased AI usage lead to higher productivity?
SELECT
    CASE
        WHEN AI_Usage_Hours_Per_Day < 2 THEN 'Low Usage'
        WHEN AI_Usage_Hours_Per_Day < 5 THEN 'Medium Usage'
        ELSE 'High Usage'
    END AS usage_group,
    COUNT(*) AS total_users,
    ROUND(AVG(Productivity_Score), 2) AS avg_productivity_score
FROM ai_usage
GROUP BY usage_group
ORDER BY avg_productivity_score DESC;


-- 4. Are users who spend more on AI tools receiving better productivity
--    and time-saving benefits?
SELECT
    CASE
        WHEN Monthly_AI_Cost < 20 THEN 'Low Spending'
        WHEN Monthly_AI_Cost < 50 THEN 'Medium Spending'
        ELSE 'High Spending'
    END AS spending_group,
    COUNT(*) AS total_users,
    ROUND(AVG(Productivity_Score), 2) AS avg_productivity_score,
    ROUND(AVG(Time_Saved_Hours_Per_Week), 2) AS avg_hours_saved_per_week
FROM ai_usage
GROUP BY spending_group
ORDER BY avg_productivity_score DESC;


-- 5. Which AI tools have the highest and lowest satisfaction scores?
SELECT
    AI_Tool,
    ROUND(AVG(Satisfaction_Score), 2) AS avg_satisfaction_score,
    COUNT(*) AS total_users
FROM ai_usage
GROUP BY AI_Tool
ORDER BY avg_satisfaction_score DESC;


-- 6. Do students and professionals prefer different AI tools?
SELECT
    User_Type,
    AI_Tool,
    COUNT(*) AS total_users
FROM ai_usage
GROUP BY User_Type, AI_Tool
ORDER BY User_Type, total_users DESC;


-- 7. Which AI tools and purposes are associated with the best
--    productivity, accuracy and satisfaction?
SELECT
    AI_Tool,
    AI_Purpose,
    ROUND(AVG(Productivity_Score), 2) AS avg_productivity_score,
    ROUND(AVG(Accuracy_Rating), 2) AS avg_accuracy_rating,
    ROUND(AVG(Satisfaction_Score), 2) AS avg_satisfaction_score,
    COUNT(*) AS total_users
FROM ai_usage
GROUP BY AI_Tool, AI_Purpose
ORDER BY avg_productivity_score DESC,
         avg_accuracy_rating DESC,
         avg_satisfaction_score DESC;


-- 8. How do AI usage patterns differ across countries and user types?
SELECT
    Country,
    User_Type,
    COUNT(*) AS total_users,
    ROUND(AVG(AI_Usage_Hours_Per_Day), 2) AS avg_daily_ai_usage_hours,
    ROUND(AVG(Productivity_Score), 2) AS avg_productivity_score,
    ROUND(AVG(Satisfaction_Score), 2) AS avg_satisfaction_score
FROM ai_usage
GROUP BY Country, User_Type
ORDER BY Country, total_users DESC;
