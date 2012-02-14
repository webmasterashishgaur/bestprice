dataSource {
	pooled = true
	dbCreate = "update"
	driverClassName = "com.mysql.jdbc.Driver"
	username = "root"
	password = "noel"
}

hibernate {
	cache.use_second_level_cache=true
	cache.use_query_cache=true
	cache.provider_class='org.hibernate.cache.EhCacheProvider'
}

environments {
	production {
		dataSource {
			url = "jdbc:mysql://localhost:3306/bestprice"
		}
	}

	test {
		dataSource {
			url = "jdbc:mysql://localhost:3306/bestprice"
		}
	}

	development {
		dataSource {
			url = "jdbc:mysql://localhost:3306/bestprice"
		}
	}
}