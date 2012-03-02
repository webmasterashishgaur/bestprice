package bestprice



import org.junit.*
import grails.test.mixin.*

@TestFor(NegociacionEncController)
@Mock(NegociacionEnc)
class NegociacionEncControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/negociacionEnc/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.negociacionEncInstanceList.size() == 0
        assert model.negociacionEncInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.negociacionEncInstance != null
    }

    void testSave() {
        controller.save()

        assert model.negociacionEncInstance != null
        assert view == '/negociacionEnc/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/negociacionEnc/show/1'
        assert controller.flash.message != null
        assert NegociacionEnc.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/negociacionEnc/list'


        populateValidParams(params)
        def negociacionEnc = new NegociacionEnc(params)

        assert negociacionEnc.save() != null

        params.id = negociacionEnc.id

        def model = controller.show()

        assert model.negociacionEncInstance == negociacionEnc
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/negociacionEnc/list'


        populateValidParams(params)
        def negociacionEnc = new NegociacionEnc(params)

        assert negociacionEnc.save() != null

        params.id = negociacionEnc.id

        def model = controller.edit()

        assert model.negociacionEncInstance == negociacionEnc
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/negociacionEnc/list'

        response.reset()


        populateValidParams(params)
        def negociacionEnc = new NegociacionEnc(params)

        assert negociacionEnc.save() != null

        // test invalid parameters in update
        params.id = negociacionEnc.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/negociacionEnc/edit"
        assert model.negociacionEncInstance != null

        negociacionEnc.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/negociacionEnc/show/$negociacionEnc.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        negociacionEnc.clearErrors()

        populateValidParams(params)
        params.id = negociacionEnc.id
        params.version = -1
        controller.update()

        assert view == "/negociacionEnc/edit"
        assert model.negociacionEncInstance != null
        assert model.negociacionEncInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/negociacionEnc/list'

        response.reset()

        populateValidParams(params)
        def negociacionEnc = new NegociacionEnc(params)

        assert negociacionEnc.save() != null
        assert NegociacionEnc.count() == 1

        params.id = negociacionEnc.id

        controller.delete()

        assert NegociacionEnc.count() == 0
        assert NegociacionEnc.get(negociacionEnc.id) == null
        assert response.redirectedUrl == '/negociacionEnc/list'
    }
}
