r([t("?x","has a child","?y"),t("?x","has a child","?z"),t("?y","differs","?z")], 
   [t("?y","is_sibling","?z")]).

r([t("?x","has a child","?y"),t("?y","has a child","?z"),t("?y","differs","?z")], 
   [t("?x","is_grandparent","?z")]).


r([t("?x","has a child","?y"),t("?y","has a child","?z"),t("?z","has a child","?w"),t("?y","differs","?z")], 
   [t("?x","is_grand_grandparent","?w")]).