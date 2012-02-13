package bestprice

@TestFor(BitacoraPrecioController)
@Mock(BitacoraPrecio)
class BitacoraPrecioControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/bitacoraPrecio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.bitacoraPrecioInstanceList.size() == 0
        assert model.bitacoraPrecioInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.bitacoraPrecioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.bitacoraPrecioInstance != null
        assert view == '/bitacoraPrecio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/bitacoraPrecio/show/1'
        assert controller.flash.message != null
        assert BitacoraPrecio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/bitacoraPrecio/list'


        populateValidParams(params)
        def bitacoraPrecio = new BitacoraPrecio(params)

        assert bitacoraPrecio.save() != null

        params.id = bitacoraPrecio.id

        def model = controller.show()

        assert model.bitacoraPrecioInstance == bitacoraPrecio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/bitacoraPrecio/list'


        populateValidParams(params)
        def bitacoraPrecio = new BitacoraPrecio(params)

        assert bitacoraPrecio.save() != null

        params.id = bitacoraPrecio.id

        def model = controller.edit()

        assert model.bitacoraPrecioInstance == bitacoraPrecio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/bitacoraPrecio/list'

        response.reset()


        populateValidParams(params)
        def bitacoraPrecio = new BitacoraPrecio(params)

        assert bitacoraPrecio.save() != null

        // test invalid parameters in update
        params.id = bitacoraPrecio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/bitacoraPrecio/edit"
        assert model.bitacoraPrecioInstance != null

        bitacoraPrecio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/bitacoraPrecio/show/$bitacoraPrecio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        bitacoraPrecio.clearErrors()

        populateValidParams(params)
        params.id = bitacoraPrecio.id
        params.version = -1
        controller.update()

        assert view == "/bitacoraPrecio/edit"
        assert model.bitacoraPrecioInstance != null
        assert model.bitacoraPrecioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/bitacoraPrecio/list'

        response.reset()

        populateValidParams(params)
        def bitacoraPrecio = new BitacoraPrecio(params)

        assert bitacoraPrecio.save() != null
        assert BitacoraPrecio.count() == 1

        params.id = bitacoraPrecio.id

        controller.delete()

        assert BitacoraPrecio.count() == 0
        assert BitacoraPrecio.get(bitacoraPrecio.id) == null
        assert response.redirectedUrl == '/bitacoraPrecio/list'
    }
}
