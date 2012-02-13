package bestprice

@TestFor(NegociacionDetController)
@Mock(NegociacionDet)
class NegociacionDetControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/negociacionDet/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.negociacionDetInstanceList.size() == 0
        assert model.negociacionDetInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.negociacionDetInstance != null
    }

    void testSave() {
        controller.save()

        assert model.negociacionDetInstance != null
        assert view == '/negociacionDet/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/negociacionDet/show/1'
        assert controller.flash.message != null
        assert NegociacionDet.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/negociacionDet/list'


        populateValidParams(params)
        def negociacionDet = new NegociacionDet(params)

        assert negociacionDet.save() != null

        params.id = negociacionDet.id

        def model = controller.show()

        assert model.negociacionDetInstance == negociacionDet
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/negociacionDet/list'


        populateValidParams(params)
        def negociacionDet = new NegociacionDet(params)

        assert negociacionDet.save() != null

        params.id = negociacionDet.id

        def model = controller.edit()

        assert model.negociacionDetInstance == negociacionDet
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/negociacionDet/list'

        response.reset()


        populateValidParams(params)
        def negociacionDet = new NegociacionDet(params)

        assert negociacionDet.save() != null

        // test invalid parameters in update
        params.id = negociacionDet.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/negociacionDet/edit"
        assert model.negociacionDetInstance != null

        negociacionDet.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/negociacionDet/show/$negociacionDet.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        negociacionDet.clearErrors()

        populateValidParams(params)
        params.id = negociacionDet.id
        params.version = -1
        controller.update()

        assert view == "/negociacionDet/edit"
        assert model.negociacionDetInstance != null
        assert model.negociacionDetInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/negociacionDet/list'

        response.reset()

        populateValidParams(params)
        def negociacionDet = new NegociacionDet(params)

        assert negociacionDet.save() != null
        assert NegociacionDet.count() == 1

        params.id = negociacionDet.id

        controller.delete()

        assert NegociacionDet.count() == 0
        assert NegociacionDet.get(negociacionDet.id) == null
        assert response.redirectedUrl == '/negociacionDet/list'
    }
}
