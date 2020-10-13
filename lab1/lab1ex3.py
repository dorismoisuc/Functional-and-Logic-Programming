'''
3. a. Check if a list is a set.
b. Determine the number of distinct elements from a list.
'''


class Nod :
    def __init__(self, value) :
        self.value = value
        self.next = None


class Lista:
    def __init__(self):
        self.head = None

    def empty_list(self):
        new_list=Lista()
        return new_list

    def first_element(self):
        return self.head.value

    def sublist(self):
        sublist=Lista()
        sublist.head=self.head.next
        return sublist

    def is_empty(self):
        if self.head==None:
            return True
        return False





def create_list():
    lista=Lista()
    lista.head=create_list_rec()
    return lista

def create_list_rec():
    value=int(input("Element="))
    if value==0:
        return None
    else:
        nod=Nod(value)
        nod.next=create_list_rec()
        return nod

def tipar(lista):
    tipar_rec(lista.head)

def tipar_rec(nod):
    if nod!=None:
        print(nod.value)
        tipar_rec(nod.next)


def belongs(element,lista):
    '''

    :param element: the element which we verify if is in the list
    :param lista: the list in which we search
    :return: true, if the element exists in the list
             false, if the element doesn't exist in the list
    MATHEMATICAL MODEL:
        belongs(element,[l1,l2,...,ln]): false, if l is empty
                                true, if l1=element,
                                belongs(element,[l2,...,ln] otherwise
    '''
    if lista.is_empty()==True:
        return False
    elif lista.first_element()==element:
        return True
    else:
        return belongs(element,lista.sublist())


def ex3a(lista):
    '''
    :param lista: the list which we verify if is a set
    :return: true, if the list is a set
             false, if the list is not a set
    MATHEMATICAL MODEL:
        ex3a([l1,l2,...,ln])= true, if l is empty
                              false, if l1 ∈ [l2,...,ln]
                              ex3a([l2,...,ln]) otherwise
    We verify if the first element of the list belongs in the sublist ([l2,...,ln]) and if it does, it is not a set
    If it doesn't, we call the function again for the sublist
    '''
    if lista.is_empty()==True:
        return True
    elif belongs(lista.first_element(),lista.sublist())==True:
        return False
    else:
        return ex3a(lista.sublist())

def ex3b(lista):
    '''
    :param lista: the list in which we search for distinct elements and count them
    :return: the number of distinct elements
    MATHEMATICAL MODEL:
        ex3b([l1,l2,...,ln])= 0, if l is empty
                              ex3b([l2,l3,...,ln]) if l1 ∈ [l2,...,ln]
                              1 + ex3b([l2,l3,...,ln]) if l1 ∉ [l2,...,ln] otherwise
    We verify if the first element of the list belongs in the sublist [l2,...,ln]. If it doesn't, we count
    it as a distinct element in the list and recall the function + 1.
    If it does, we only recall the function.
    '''
    if lista.is_empty()==True:
        return 0
    elif belongs(lista.first_element(), lista.sublist()):
        return ex3b(lista.sublist())
    else:
        return 1 + ex3b(lista.sublist())

def nr_of_occurences(element,lista):
    '''
    :param element: the element which we verify how many times it appears
    :param lista: the list in which we search
    :return: the number of occurences of the element
    MATHEMATICAL MODEL:
        nr_of_occurences(element,[l1,l2,...,ln]): 0, if l is empty
                                                  1 + nr_of_occurences(element,[l2,...,ln]) if l1 ∈ [l2,...,ln]
                                                  nr_of_occurences(element,[l2,...,ln]) if l1 ∉ [l2,...,ln] otherwise
    '''
    if lista.is_empty()==True:
        return 0
    elif lista.first_element()==element:
        return 1+nr_of_occurences(element,lista.sublist())
    else:
        return nr_of_occurences(element,lista.sublist())


def ex3b_uniq(lista):
    '''
    :param lista: the list in which we search for unique elems
    :return: the number of unique elems
    MATHEMATICAL MODEL:
        ex3b_uniq([l1,...,ln])= 0, if l is empty
                                ex3b_uniq([l2,...,ln]) if nr_of_occurences(l1,[l2,...,ln])!=0
                                1+ex3b_uniq([l2,...,ln]) if nr_of_occurences(l1,[l2,...,ln])==0
    '''
    if lista.is_empty()==True:
        return 0
    if nr_of_occurences(lista.first_element(),lista.sublist())>0:
        return ex3b_uniq(lista.sublist())
    else:
        return 1+ex3b_uniq(lista.sublist())

def run():
    lista = Lista()
    lista=create_list()
    #tipar(lista)

    if (ex3a(lista)==True):
        print("The list is also a set")
    else:
        print("The list is not also a set")

    print("The number of distinct elements is:", ex3b(lista))
    #print(nr_of_occurences(2,lista))
    print("The number of unique elements is:",ex3b_uniq(lista))

run()