dataSource {
	pooled = true
	dbCreate = "update"
	driverClassName = "com.mysql.jdbc.Driver"
	username = "pruebas"
	password = "pruebas"
	properties {
		minEvictableIdleTimeMillis = 60000
		timeBetweenEvictionRunsMillis = 60000
		maxWait = 10000
		/*
		initialSize = 1
		maxActive = 1
		maxIdle = 1
		minIdle = 1
		*/
	}
}

hibernate {
	cache.use_second_level_cache=false
	cache.use_query_cache=false
	cache.provider_class='org.hibernate.cache.EhCacheProvider'
}

environments {
	production {
		dataSource {
			url = "jdbc:mysql://instance5733.db.xeround.com:4113/bestprice"
		}
	}

	test {
		dataSource {
			url = "jdbc:mysql://instance5733.db.xeround.com:4113/bestprice"
		}
	}

	development {
		dataSource {
			url = "jdbc:mysql://instance5733.db.xeround.com:4113/bestprice"
		}
	}
}