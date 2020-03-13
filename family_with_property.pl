
f("zhou_zu","has a spouse","zhou_zunai").
f("wang_zu","has a spouse","wang_zunai").

f("wang_zu","has a child","zhou_nai").
f("zhou_zu","has a child","zhou_ye").

f("zhou_ye","has a spouse","zhou_nai").
f("zhou_ye","has a child","yu_ma").
f("zhou_ye","has a child","yu_ma").
f("zhou_ye","has a child","zhou_ba").
f("zhou_ye","has a child","wang_ba").

f("yu_ma","has a spouse","li_ba").
f("zhou_ba","has a spouse","zhou_ma").
f("wang_ba","has a spouse","wang_ma").

f("yu_ma","has a child","li_hua").
f("yu_ma","has a child","li_wa").

f("zhou_ba","has a child","zhou_yi").
f("zhou_ba","has a child","zhou_er").
f("zhou_ba","has a child","zhou_san").

f("wang_ba","has a child","wang_yi").
f("wang_ba","has a child","wang_er").
f("wang_ba","has a child","wang_san").

f("li_hua","has a profession","pop star").
f("wang_yi","has a hobby","guitar").
f("zhou_yi","lives in","London").


t("x").

onto("question.ql").



r([t("?x","has a child","?y"),t("?x","has a child","?z"),t("?y","differs","?z")], 
   [t("?y","is_sibling","?z")]).

r([t("?x","has a child","?y"),t("?y","has a child","?z"),t("?y","differs","?z")], 
   [t("?x","is_grandparent","?z")]).


r([t("?x","has a child","?y"),t("?y","has a child","?z"),t("?z","has a child","?w"),t("?y","differs","?z")], 
   [t("?x","is_grand_grandparent","?w")]).
