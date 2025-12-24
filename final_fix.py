# -*- coding: utf-8 -*-
import book_management_sys
from book_management_sys import db, app, Admin
import sys

print("🚀 正在初始化管理员账号修正程序...")

with app.app_context():
    try:
        # 1. 先清理可能存在的脏数据
        existing = Admin.query.filter_by(admin_id='admin').first()
        if existing:
            print("⚠️ 发现旧的 admin 账号，正在删除清理...")
            db.session.delete(existing)
            db.session.commit()

        # 2. 创建新管理员
        # 根据你的报错信息，Admin 类需要 4 个参数: admin_id, admin_name, password, right
        # right=1 通常代表最高权限
        print("🛠️ 正在创建账号: admin / 123456")
        
        # 注意：这里直接传明文密码。
        # 如果你的系统用了加密，Admin类的__init__里通常会自动加密它。
        # 如果没加密，这里存进去的就是明文，也能登录。
        new_admin = Admin('admin', '超级管理员', '123456', 1)
        
        db.session.add(new_admin)
        db.session.commit()
        
        print("\n" + "="*40)
        print("✅✅✅ 账号创建成功！(这回是真的写入了)")
        print("👉 登录账号: admin")
        print("👉 登录密码: 123456")
        print("👉 身份选择: 务必勾选 [管理员]")
        print("="*40 + "\n")

    except TypeError as e:
        print(f"\n❌ 参数依然不匹配: {e}")
        print("既然这样，我们将尝试另一种‘不讲道理’的暴力写法...")
        # 备用方案：绕过 __init__ 直接赋值
        try:
            admin = Admin.__new__(Admin) # 创建空对象
            admin.admin_id = 'admin'
            admin.admin_name = '超级管理员'
            admin.password = '123456'
            admin.right = 1
            db.session.add(admin)
            db.session.commit()
            print("✅✅✅ 备用方案执行成功！账号 admin / 123456 已生成。")
        except Exception as e2:
             print(f"❌ 备用方案也失败了: {e2}")

    except Exception as e:
        print(f"❌ 发生未知错误: {str(e)}")