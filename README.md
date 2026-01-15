# expense_tracker_flutter_app

A new Flutter project.
# expense-tracker-provider-flutter


<img width="391" height="613" alt="full" src="https://github.com/user-attachments/assets/0bd9456f-f29b-4f68-a33d-b84ceed077ea" />
<img width="501" height="942" alt="chart" src="https://github.com/user-attachments/assets/bbf3e3cc-813b-442b-8914-ff5551e30cab" />
<img width="395" height="612" alt="Capture" src="https://github.com/user-attachments/assets/2dfba4f7-7340-458d-b01a-8a17eaf7185a" />
<img width="328" height="641" alt="3" src="https://github.com/user-attachments/assets/7aaca77f-b4b7-42f9-a36f-223ef8f5f474" />
<img width="329" height="643" alt="2" src="https://github.com/user-attachments/assets/68789400-bec4-4a57-9907-6389e808964e" />
<img width="329" height="637" alt="1" src="https://github.com/user-attachments/assets/8d1fe289-05ba-43a8-b89c-d648ece00477" />



[Uploading Expense Tracker App - Provider Version Blueprint.pdf…]()


[expense_tracker_mockup.html](https://github.com/user-attachments/files/24643569/expense_tracker_mockup.html)
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense Tracker - Visual Mockups</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
        }

        .header {
            text-align: center;
            color: white;
            margin-bottom: 30px;
        }

        .header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        .screen-nav {
            display: flex;
            gap: 10px;
            justify-content: center;
            flex-wrap: wrap;
            margin-bottom: 30px;
        }

        .screen-nav button {
            background: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.3s;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .screen-nav button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
        }

        .screen-nav button.active {
            background: #667eea;
            color: white;
        }

        .mockup-wrapper {
            background: #f5f5f5;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
        }

        .phone-frame {
            max-width: 400px;
            margin: 0 auto;
            background: white;
            border-radius: 30px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
            overflow: hidden;
            border: 8px solid #333;
        }

        .screen {
            display: none;
        }

        .screen.active {
            display: block;
        }

        .status-bar {
            background: white;
            padding: 8px 20px;
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            border-bottom: 1px solid #e0e0e0;
        }

        .app-bar {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 16px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .app-bar h2 {
            font-size: 20px;
        }

        .icon-btn {
            background: rgba(255,255,255,0.2);
            border: none;
            color: white;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background 0.3s;
        }

        .icon-btn:hover {
            background: rgba(255,255,255,0.3);
        }

        .screen-content {
            background: #f8f9fa;
            min-height: 600px;
            padding: 16px;
        }

        .summary-cards {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 12px;
            margin-bottom: 20px;
        }

        .summary-card {
            background: white;
            border-radius: 12px;
            padding: 16px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            text-align: center;
        }

        .summary-card .icon {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            margin: 0 auto 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
        }

        .summary-card .label {
            font-size: 12px;
            color: #666;
            margin-bottom: 4px;
        }

        .summary-card .amount {
            font-size: 24px;
            font-weight: bold;
        }

        .expense-list {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .expense-list-header {
            padding: 16px;
            border-bottom: 1px solid #e0e0e0;
            font-weight: 600;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .expense-item {
            padding: 16px;
            border-bottom: 1px solid #f0f0f0;
            display: flex;
            align-items: center;
            gap: 12px;
            transition: background 0.2s;
        }

        .expense-item:hover {
            background: #f8f9fa;
        }

        .expense-item:last-child {
            border-bottom: none;
        }

        .expense-icon {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            flex-shrink: 0;
        }

        .expense-details {
            flex: 1;
        }

        .expense-title {
            font-weight: 600;
            margin-bottom: 4px;
        }

        .expense-meta {
            font-size: 12px;
            color: #666;
        }

        .expense-amount {
            font-weight: 700;
            font-size: 16px;
            color: #e74c3c;
        }

        .fab {
            position: absolute;
            bottom: 80px;
            right: 36px;
            width: 56px;
            height: 56px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            font-size: 24px;
            cursor: pointer;
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
            transition: transform 0.3s;
        }

        .fab:hover {
            transform: scale(1.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #333;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            font-family: inherit;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #667eea;
        }

        .category-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
        }

        .category-item {
            aspect-ratio: 1;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s;
            background: #f8f9fa;
        }

        .category-item:hover {
            transform: translateY(-2px);
        }

        .category-item.selected {
            border-color: currentColor;
            background: currentColor;
            color: white;
        }

        .category-item .cat-icon {
            font-size: 28px;
            margin-bottom: 4px;
        }

        .category-item .cat-name {
            font-size: 10px;
            font-weight: 600;
        }

        .btn-primary {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
        }

        .chart-container {
            background: white;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 16px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .chart-title {
            font-weight: 600;
            margin-bottom: 16px;
        }

        .pie-chart {
            width: 200px;
            height: 200px;
            margin: 20px auto;
            border-radius: 50%;
            background: conic-gradient(
                #ff9500 0deg 90deg,
                #007aff 90deg 180deg,
                #af52de 180deg 270deg,
                #ff2d55 270deg 360deg
            );
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .bar-chart {
            display: flex;
            align-items: flex-end;
            justify-content: space-around;
            height: 200px;
            margin: 20px 0;
            gap: 8px;
        }

        .bar {
            flex: 1;
            background: linear-gradient(180deg, #667eea 0%, #764ba2 100%);
            border-radius: 8px 8px 0 0;
            position: relative;
            transition: all 0.3s;
        }

        .bar:hover {
            opacity: 0.8;
        }

        .bar-label {
            position: absolute;
            bottom: -25px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 11px;
            color: #666;
        }

        .category-breakdown {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .category-row {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .category-color {
            width: 24px;
            height: 24px;
            border-radius: 4px;
            flex-shrink: 0;
        }

        .category-info {
            flex: 1;
        }

        .category-name-stat {
            font-weight: 600;
            font-size: 14px;
        }

        .category-percentage {
            font-size: 12px;
            color: #666;
        }

        .category-amount-stat {
            font-weight: 700;
            color: #e74c3c;
        }

        .tabs {
            display: flex;
            background: white;
            border-radius: 12px;
            margin-bottom: 16px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .tab {
            flex: 1;
            padding: 12px;
            text-align: center;
            cursor: pointer;
            border: none;
            background: white;
            font-weight: 600;
            transition: all 0.3s;
        }

        .tab.active {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #666;
        }

        .empty-state-icon {
            font-size: 64px;
            margin-bottom: 16px;
            opacity: 0.3;
        }

        @media (max-width: 768px) {
            .mockup-wrapper {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>💰 Expense Tracker Mockups</h1>
            <p>Interactive Visual Design for Flutter App</p>
        </div>

        <div class="screen-nav">
            <button class="active" onclick="showScreen('home')">🏠 Home</button>
            <button onclick="showScreen('add')">➕ Add Expense</button>
            <button onclick="showScreen('statistics')">📊 Statistics</button>
            <button onclick="showScreen('edit')">✏️ Edit Expense</button>
        </div>

        <div class="mockup-wrapper">
            <div class="phone-frame">
                <!-- HOME SCREEN -->
                <div class="screen active" id="home">
                    <div class="status-bar">
                        <span>9:41</span>
                        <span>📶 🔋</span>
                    </div>
                    <div class="app-bar">
                        <h2>Expense Tracker</h2>
                        <button class="icon-btn">⚙️</button>
                    </div>
                    <div class="screen-content">
                        <div class="summary-cards">
                            <div class="summary-card">
                                <div class="icon" style="background: rgba(231, 76, 60, 0.1);">
                                    <span style="color: #e74c3c;">💳</span>
                                </div>
                                <div class="label">Total Expense</div>
                                <div class="amount" style="color: #e74c3c;">$2,845</div>
                            </div>
                            <div class="summary-card">
                                <div class="icon" style="background: rgba(46, 204, 113, 0.1);">
                                    <span style="color: #2ecc71;">💰</span>
                                </div>
                                <div class="label">This Month</div>
                                <div class="amount" style="color: #2ecc71;">$1,234</div>
                            </div>
                            <div class="summary-card">
                                <div class="icon" style="background: rgba(52, 152, 219, 0.1);">
                                    <span style="color: #3498db;">📈</span>
                                </div>
                                <div class="label">Average</div>
                                <div class="amount" style="color: #3498db;">$412</div>
                            </div>
                            <div class="summary-card">
                                <div class="icon" style="background: rgba(155, 89, 182, 0.1);">
                                    <span style="color: #9b59b6;">🔢</span>
                                </div>
                                <div class="label">Transactions</div>
                                <div class="amount" style="color: #9b59b6;">24</div>
                            </div>
                        </div>

                        <div class="expense-list">
                            <div class="expense-list-header">
                                <span>Recent Transactions</span>
                                <span style="color: #667eea; cursor: pointer; font-size: 14px;">See All</span>
                            </div>
                            <div class="expense-item">
                                <div class="expense-icon" style="background: rgba(255, 149, 0, 0.1); color: #ff9500;">
                                    🍔
                                </div>
                                <div class="expense-details">
                                    <div class="expense-title">Lunch at Restaurant</div>
                                    <div class="expense-meta">Food • Today</div>
                                </div>
                                <div class="expense-amount">$45.50</div>
                            </div>
                            <div class="expense-item">
                                <div class="expense-icon" style="background: rgba(0, 122, 255, 0.1); color: #007aff;">
                                    🚗
                                </div>
                                <div class="expense-details">
                                    <div class="expense-title">Uber Ride</div>
                                    <div class="expense-meta">Transport • Today</div>
                                </div>
                                <div class="expense-amount">$12.00</div>
                            </div>
                            <div class="expense-item">
                                <div class="expense-icon" style="background: rgba(175, 82, 222, 0.1); color: #af52de;">
                                    🛍️
                                </div>
                                <div class="expense-details">
                                    <div class="expense-title">Amazon Purchase</div>
                                    <div class="expense-meta">Shopping • Yesterday</div>
                                </div>
                                <div class="expense-amount">$89.99</div>
                            </div>
                            <div class="expense-item">
                                <div class="expense-icon" style="background: rgba(255, 45, 85, 0.1); color: #ff2d55;">
                                    🎬
                                </div>
                                <div class="expense-details">
                                    <div class="expense-title">Movie Tickets</div>
                                    <div class="expense-meta">Entertainment • Yesterday</div>
                                </div>
                                <div class="expense-amount">$30.00</div>
                            </div>
                            <div class="expense-item">
                                <div class="expense-icon" style="background: rgba(255, 59, 48, 0.1); color: #ff3b30;">
                                    📱
                                </div>
                                <div class="expense-details">
                                    <div class="expense-title">Phone Bill</div>
                                    <div class="expense-meta">Bills • Jan 10</div>
                                </div>
                                <div class="expense-amount">$65.00</div>
                            </div>
                        </div>
                    </div>
                    <button class="fab">+</button>
                </div>

                <!-- ADD EXPENSE SCREEN -->
                <div class="screen" id="add">
                    <div class="status-bar">
                        <span>9:41</span>
                        <span>📶 🔋</span>
                    </div>
                    <div class="app-bar">
                        <button class="icon-btn">←</button>
                        <h2>Add Expense</h2>
                        <div style="width: 36px;"></div>
                    </div>
                    <div class="screen-content">
                        <form>
                            <div class="form-group">
                                <label>Title</label>
                                <input type="text" placeholder="Enter expense title" value="Coffee">
                            </div>

                            <div class="form-group">
                                <label>Amount</label>
                                <input type="number" placeholder="0.00" value="5.50">
                            </div>

                            <div class="form-group">
                                <label>Category</label>
                                <div class="category-grid">
                                    <div class="category-item" style="color: #ff9500;">
                                        <div class="cat-icon">🍔</div>
                                        <div class="cat-name">Food</div>
                                    </div>
                                    <div class="category-item" style="color: #007aff;">
                                        <div class="cat-icon">🚗</div>
                                        <div class="cat-name">Transport</div>
                                    </div>
                                    <div class="category-item" style="color: #af52de;">
                                        <div class="cat-icon">🛍️</div>
                                        <div class="cat-name">Shopping</div>
                                    </div>
                                    <div class="category-item" style="color: #ff2d55;">
                                        <div class="cat-icon">🎬</div>
                                        <div class="cat-name">Fun</div>
                                    </div>
                                    <div class="category-item" style="color: #ff3b30;">
                                        <div class="cat-icon">📱</div>
                                        <div class="cat-name">Bills</div>
                                    </div>
                                    <div class="category-item" style="color: #34c759;">
                                        <div class="cat-icon">🏥</div>
                                        <div class="cat-name">Health</div>
                                    </div>
                                    <div class="category-item selected" style="color: #8e8e93;">
                                        <div class="cat-icon">📋</div>
                                        <div class="cat-name">Other</div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Date</label>
                                <input type="date" value="2026-01-12">
                            </div>

                            <div class="form-group">
                                <label>Notes (Optional)</label>
                                <input type="text" placeholder="Add notes...">
                            </div>

                            <button type="button" class="btn-primary">Save Expense</button>
                        </form>
                    </div>
                </div>

                <!-- STATISTICS SCREEN -->
                <div class="screen" id="statistics">
                    <div class="status-bar">
                        <span>9:41</span>
                        <span>📶 🔋</span>
                    </div>
                    <div class="app-bar">
                        <button class="icon-btn">←</button>
                        <h2>Statistics</h2>
                        <div style="width: 36px;"></div>
                    </div>
                    <div class="screen-content">
                        <div class="tabs">
                            <button class="tab active">Week</button>
                            <button class="tab">Month</button>
                            <button class="tab">Year</button>
                        </div>

                        <div class="chart-container">
                            <div class="chart-title">Expenses by Category</div>
                            <div class="pie-chart"></div>
                            <div class="category-breakdown">
                                <div class="category-row">
                                    <div class="category-color" style="background: #ff9500;"></div>
                                    <div class="category-info">
                                        <div class="category-name-stat">Food</div>
                                        <div class="category-percentage">32%</div>
                                    </div>
                                    <div class="category-amount-stat">$395</div>
                                </div>
                                <div class="category-row">
                                    <div class="category-color" style="background: #007aff;"></div>
                                    <div class="category-info">
                                        <div class="category-name-stat">Transport</div>
                                        <div class="category-percentage">25%</div>
                                    </div>
                                    <div class="category-amount-stat">$308</div>
                                </div>
                                <div class="category-row">
                                    <div class="category-color" style="background: #af52de;"></div>
                                    <div class="category-info">
                                        <div class="category-name-stat">Shopping</div>
                                        <div class="category-percentage">28%</div>
                                    </div>
                                    <div class="category-amount-stat">$345</div>
                                </div>
                                <div class="category-row">
                                    <div class="category-color" style="background: #ff2d55;"></div>
                                    <div class="category-info">
                                        <div class="category-name-stat">Entertainment</div>
                                        <div class="category-percentage">15%</div>
                                    </div>
                                    <div class="category-amount-stat">$186</div>
                                </div>
                            </div>
                        </div>

                        <div class="chart-container">
                            <div class="chart-title">Daily Expenses</div>
                            <div class="bar-chart">
                                <div class="bar" style="height: 60%;">
                                    <div class="bar-label">Mon</div>
                                </div>
                                <div class="bar" style="height: 85%;">
                                    <div class="bar-label">Tue</div>
                                </div>
                                <div class="bar" style="height: 45%;">
                                    <div class="bar-label">Wed</div>
                                </div>
                                <div class="bar" style="height: 100%;">
                                    <div class="bar-label">Thu</div>
                                </div>
                                <div class="bar" style="height: 70%;">
                                    <div class="bar-label">Fri</div>
                                </div>
                                <div class="bar" style="height: 55%;">
                                    <div class="bar-label">Sat</div>
                                </div>
                                <div class="bar" style="height: 40%;">
                                    <div class="bar-label">Sun</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- EDIT EXPENSE SCREEN -->
                <div class="screen" id="edit">
                    <div class="status-bar">
                        <span>9:41</span>
                        <span>📶 🔋</span>
                    </div>
                    <div class="app-bar">
                        <button class="icon-btn">←</button>
                        <h2>Edit Expense</h2>
                        <button class="icon-btn">🗑️</button>
                    </div>
                    <div class="screen-content">
                        <form>
                            <div class="form-group">
                                <label>Title</label>
                                <input type="text" value="Lunch at Restaurant">
                            </div>

                            <div class="form-group">
                                <label>Amount</label>
                                <input type="number" value="45.50">
                            </div>

                            <div class="form-group">
                                <label>Category</label>
                                <div class="category-grid">
                                    <div class="category-item selected" style="color: #ff9500;">
                                        <div class="cat-icon">🍔</div>
                                        <div class="cat-name">Food</div>
                                    </div>
                                    <div class="category-item" style="color: #007aff;">
                                        <div class="cat-icon">🚗</div>
                                        <div class="cat-name">Transport</div>
                                    </div>
                                    <div class="category-item" style="color: #af52de;">
                                        <div class="cat-icon">🛍️</div>
                                        <div class="cat-name">Shopping</div>
                                    </div>
                                    <div class="category-item" style="color: #ff2d55;">
                                        <div class="cat-icon">🎬</div>
                                        <div class="cat-name">Fun</div>
                                    </div>
                                    <div class="category-item" style="color: #ff3b30;">
                                        <div class="cat-icon">📱</div>
                                        <div class="cat-name">Bills</div>
                                    </div>
                                    <div class="category-item" style="color: #34c759;">
                                        <div class="cat-icon">🏥</div>
                                        <div class="cat-name">Health</div>
                                    </div>
                                    <div class="category-item" style="color: #8e8e93;">
                                        <div class="cat-icon">📋</div>
                                        <div class="cat-name">Other</div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Date</label>
                                <input type="date" value="2026-01-12">
                            </div>

                            <div class="form-group">
                                <label>Notes</label>
                                <input type="text" value="Great food and service!">
                            </div>

                            <button type="button" class="btn-primary">Update Expense</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function showScreen(screenName) {
            document.querySelectorAll('.screen').forEach(s => s.classList.remove('active'));
            document.querySelectorAll('.screen-nav button').forEach(b => b.classList.remove('active'));
            
            document.getElementById(screenName).classList.add('active');
            event.target.classList.add('active');
        }

        // Add interactivity to category selection
        document.querySelectorAll('.category-item').forEach(item => {
            item.addEventListener('click', function() {
                const parent = this.closest('.category-grid');
                parent.querySelectorAll('.category-item').forEach(i => i.classList.remove('selected'));
                this.classList.add('selected');
            });
        });

        // Add interactivity to tabs
        document.querySelectorAll('.tab').forEach(tab => {
            tab.addEventListener('click', function() {
                const parent = this.closest('.tabs');
                parent.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
                this.classList.add('active');
            });
        });
    </script>
</body>
</html>
