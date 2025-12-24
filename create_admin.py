# from book_management_sys import db, Admin, app

# # 启动 Flask 的上下文环境，这样才能操作数据库
# with app.app_context():
#     # 1. 先检查是否已经存在你想创建的账号
#     check_user = Admin.query.filter_by(username='admin').first()
    
#     if check_user:
#         print("账号 admin 已存在，正在尝试重置密码为 123456...")
#         check_user.password = '123456' # 这里会自动触发哈希加密
#         check_user.is_admin = 1        # 确保它是管理员
#     else:
#         print("正在创建新管理员账号：admin / 密码：123456")
#         new_admin = Admin(
#             username='admin',
#             password='123456', # 框架会自动调用加密函数
#             nickname='超级管理员',
#             is_admin=1
#         )
#         db.session.add(new_admin)
    
#     db.session.commit()
#     print("✅ 执行成功！请启动程序并使用 admin / 123456 登录。")



import book_management_sys
# 显式导入 Admin 类
from book_management_sys import db, app, Admin 

with app.app_context():
    print("=" * 40)
    print("🔍 正在破解 Admin (管理员) 表结构...")
    
    # 1. 偷看数据库到底有哪些字段
    columns = Admin.__table__.columns.keys()
    print(f"📋 Admin 表的所有字段: {columns}")

    # 2. 动态构造管理员数据 (自适应)
    admin_data = {}
    
    # --- 猜账号字段 ---
    if 'admin_id' in columns: 
        admin_data['admin_id'] = 'admin'
        account_hint = "admin"
    elif 'id' in columns: 
        admin_data['id'] = 1
        account_hint = "1"
    else:
        # 如果都不是，取第一个字段做账号
        first_col = columns[0]
        admin_data[first_col] = 'admin'
        account_hint = "admin"

    # --- 猜密码字段 ---
    if 'password' in columns: 
        admin_data['password'] = '123456'
    elif 'password_hash' in columns:
        from werkzeug.security import generate_password_hash
        admin_data['password_hash'] = generate_password_hash('123456')
    
    # --- 猜姓名字段 ---
    if 'name' in columns: admin_data['name'] = '超级管理员'
    
    print(f"🛠️ 构造出的管理员数据: {admin_data}")

    # 3. 暴力写入
    try:
        # 清除旧数据防止冲突
        db.session.query(Admin).delete()
        db.session.commit()
        print("🧹 已清空旧的管理员表")

        # 插入新管理员
        new_admin = Admin(**admin_data)
        db.session.add(new_admin)
        db.session.commit()
        
        print("\n" + "="*40)
        print("🎉🎉🎉 管理员账号创建成功！")
        print(f"👉 登录账号: {account_hint}")
        print(f"👉 登录密码: 123456")
        print("="*40 + "\n")
        
    except Exception as e:
        print(f"❌ 写入失败: {str(e)}")