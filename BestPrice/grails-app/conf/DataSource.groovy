dataSource {
	pooled = true
	dbCreate = "update"
	driverClassName = "com.mysql.jdbc.Driver"
	username = "pruebas"
	password = "pruebas"
	properties {
		maxActive = 100
		maxIdle = 25
		minIdle = 5
		minEvictableIdleTimeMillis = 60000
		timeBetweenEvictionRunsMillis = 60000
		maxWait = 10000
		initialSize = 3		
	}
}

hibernate {
	cache.use_second_level_cache=true
	cache.use_query_cache=true
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