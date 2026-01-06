def main():
    # Create database engines
    s_engine = create_engine(SOURCE_DB)
    d_engine = create_engine(DEST_DB)
    
    # Get list of tables from source
    inspector = inspect(s_engine)
    tables = inspector.get_table_names()
    
    print(f"Found {len(tables)} tables to migrate.")
    
    for table in tables:
        migrate_table(table, s_engine, d_engine)

if __name__ == "__main__":
    main()
