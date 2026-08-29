# Zepto Inventory & Sales Analysis

![image alt](https://github.com/AnkitaSarkar-98/Zepto-Inventory-Sales-Analysis-Power-BI/blob/main/Zepto%20Analysis-Dashboard1.png?raw=true)


## Overview
This project presents an end-to-end data analysis of Zepto's sales performance, inventory health, and delivery efficiency from January to June 2024. The objective is to identify key operational inefficiencies, track sales trends across product categories, monitor stock levels, and evaluate delivery timelines to optimize supply chain management and inventory reordering strategies.

### Key Highlights:
* **Sales Performance:** Total revenue generated reached **₹26.34M** across **524K units sold**, with top-performing items including Fish, Tea, Chicken, Toothpaste, and Banana.
* **Inventory Health:** Total inventory value stands at **₹52.73M**. While ~75.9% of stock is healthy, **151 items have zero sales**, creating unnecessary capital lock-in.
* **Delivery Performance:** Out of **10K total deliveries**, only **33.4% were delivered on time**, while **33.2% were delayed** and **33.3% were partial deliveries**, with an overall average delivery time of **5.49 days**.

---

## Tools & Methods

### Tools
* **SQL:** Used for querying, aggregating, and analyzing raw transactional and inventory data (e.g., category sales, top/bottom products, inventory reorder lists, and monthly sales trends).
* **Power BI:** Used for building an interactive, multi-page executive dashboard to visualize sales trends, stock distribution, reorder requirements, and delivery SLA metrics.

### Methods & Workflow
1. **Data Querying & Transformation (SQL):**
   * Aggregated total sales and units sold by category and product.
   * Queried stock levels, reorder levels, and reorder status to generate inventory reorder lists.
   * Calculated monthly sales trends and identified products with zero sales.
   * Grouped order data by delivery status (`On Time`, `Delayed`, `Partial Delivery`) to determine average delivery lead times.

2. **Dashboard Design & Visualization (Power BI):**
   * **Executive Overview:** High-level KPI cards for total sales, inventory value, reorder items, and monthly sales trends.
   * **Inventory Performance Dashboard:** Analysis of highest stock coverage, inventory value by category, bottom-performing products, and reorder requirements.
   * **Delivery Performance & Timelines:** Breakdowns of delivery status distribution, average delivery time by category, monthly delivery trends, and status split per category.

---

## Conclusion

The analysis reveals that while sales remain steady across core categories like Meat, Produce, and Beverages, operational bottlenecks exist within inventory management and logistics fulfillment:

* **Inventory Risk:** A significant amount of capital is trapped in unsold items (**151 zero-sales products**), while high reorder frequency is needed in categories like Snacks, Health & Beauty, and Meat.
* **Delivery Bottlenecks:** Delivery reliability is low, with **~66% of orders experiencing delays or partial fulfillment**, averaging a delivery time of **5.49 days**.

### Recommendations:
* **Reduce Unsold Stock:** Re-evaluate demand forecasting and phase out or discount zero-sales items to free up capital.
* **Optimize Reorder Planning:** Prioritize restocking mechanisms for high-demand categories (Snacks, Health & Beauty, Meat) to prevent stockouts.
* **Improve Delivery Operations:** Streamline logistics and vendor management to reduce fulfillment delays and improve on-time delivery rates.

---

Thank you for taking the time to check out this project! Your interest, feedback, and contributions mean a lot. If you have any suggestions feel free to share. Don't forget to ⭐ this repository if you found it helpful it really helps others find it too.
Happy coding!
