                                          SuperMarket Sales & Velocity Analysis
📋 Project Overview:

This project provides an end-to-end analysis of a multi-branch supermarket chain. By analyzing sales velocity and branch efficiency, I identified Yangon and Mandalay as underperforming cities despite high foot traffic, recommending a shift in inventory strategy to match the high-velocity performance of Naypyitaw.


🚀 The Business Problem
Revenue Gap:->  While Naypyitaw generates the highest revenue ($110,568), Yangon is underperforming by relative growth despite having the most transactions.

Efficiency Gap:-> Branch Alex (Yangon) has a lower Average Transaction Value ($312.35) compared to Branch Giza (Naypyitaw) ($337.10).



🛠️ Technical Stack

i. SQL (MySQL): Built 6+ views for executive reporting (Sales Velocity, City Performance, KPIs).

ii. Excel/CSV: Initial data profiling and cleaning.

iii. Tableau: Branch Performance Heatmaps.



📊 Key Discoveries

Sales Velocity:-> Naypyitaw has the highest velocity (60.39), meaning they sell higher-margin products more quickly than other regions.

Payment Friction:-> Cash remains the highest revenue generator ($112,206), suggesting that digital payment incentives (E-wallets) are currently underutilized and represent a growth opportunity.

Underperformance:-> Both Yangon and Mandalay fall below the average city revenue threshold, requiring a "Sales Velocity" intervention.



📁 Project Structure

vw_executive_kpis.sql:-> The main view for the high-level dashboard.

vw_sales_velocity.sql:->  Calculates revenue efficiency per unit sold.

vw_underperforming_cities.sql:-> Identifies branches requiring immediate management attention.



💡BTSA Recommendation: 

1. Real-Time "Sales Velocity" Inventory Rebalancing
   
The Problem: Naypyitaw has a significantly higher Sales Velocity (60.39) than Yangon (57.13), indicating items move faster or for higher margins there.

BTSA Requirement: Deploy an Inventory Optimization Dashboard that tracks Sales Velocity in real-time. When velocity in Naypyitaw spikes for "Electronic Accessories," the system should suggest a "stock transfer" from the underperforming Yangon warehouse.

Business Impact: Minimizes "Stock-Out" events in high-performing regions, ensuring the company never misses a high-velocity sale due to inventory being stuck in a low-demand area.

2. Payment-Method & Digital Transformation Strategy
   
The Problem: Cash is still the king of revenue ($112,206), but E-wallets and Credit Cards represent the future of data tracking.

BTSA Requirement: Propose a Point-of-Sale (POS) Integration that offers a 2% "Loyalty Cashback" only on E-wallet transactions.

Business Impact: Moving customers from Cash to Digital allows the company to track "Customer Lifetime Value" (CLV) more accurately. Cash transactions are anonymous; digital transactions build a rich profile for future targeted marketing.

3. Branch Performance & Labor Allocation
   
The Problem: Branch Alex (Yangon) has high transactions but lower Average Transaction Value (ATV).

BTSA Requirement: Use the vw_branch_performance data to implement a Labor Optimization Model. If Yangon has high transaction volume but low ATV, the focus should be on "Self-Checkout" technology to handle volume, while Naypyitaw (High ATV) should have more "Sales Associates" on the floor for high-value upselling.

Business Impact: Reduces overhead costs in high-volume/low-value branches and maximizes revenue in high-value/low-volume branches.



<img width="1000" height="800" alt="supermarket_analysis" src="https://github.com/user-attachments/assets/afe6e2d8-053e-4d3f-9ed7-02b0a6abafbf" />
[SuperMarket_SQLanalysis.sql](https://github.com/user-attachments/files/24408313/SuperMarket_SQLanalysis.sql)
