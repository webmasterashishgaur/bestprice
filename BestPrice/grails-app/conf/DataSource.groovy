dataSource {
	pooled = true
	dbCreate = "update"
	driverClassName = "com.mysql.jdbc.Driver"
	username = "pruebas"
	password = "pruebas"
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