'''
ITERATORS:->>>  Iterator is container which holes group of elements that will be store in an object format.
           >>>  iterator can be created by useing iter functions.

ITER:->>>  This method takes exactly one parameter that is datastrcture.
      >>>  Iterator does not support iteration control behaviour (the process of controling given iterable data).

NOTE:->>>  Python iterator comes with an inbuilt function called next which is used to axis the data from an iterator.   
      >>>  next method does'nt required any parameters and they will popup one element from iterator.
      >>>  next method causes stop iteration error so its preffered to avoied next method in python.

'''
#SYNTAX:- iterator_name = iter(datastrcture)
x = iter([1,2,3,4])
print x

'''
GENARATORS:->>>  Generators ae also used to store the data in the format of an object named as generator object.
            >>>  In python every generator is an iterator but not verse.
            >>>  Generator are used to control iteration behaviour.
            >>>  We need to use the combination of a function along with yield keyword to create a generator.
            >>>  Yield statement is eqivalent to return keyword but whenever yield keyword ocuurs for the 1st time python will create a generator object and for the next time it will done the given data in to generator object.
            >>>  like iterators in generator also we can axes the data next method.

#SYNTAX:->> def generator_name(parameter)
              -------
              -------
              -------
              yield data
'''
def mygen(l):
	for ele in l:
		if ele %2==0:
			yield ele
x = mygen(range(10))
print x

def mygen(l):
	yield [ele for ele in l if ele%2==0]
x = mygen(range(10))
print x.next()
'''
DECORATORS:->>>  Decorator are wrapper function in python which will overridden on top of main function.
            >>>  If we are invoking the main function pyhton will exicute decoration function 1st,based satatus decorator decorator will exicute main function.
            >>>  To use a decorator function mention or declared @ decorator function name on top of main function.  

#SYNTAX:-  @decorator_name
           def main_function(parameter)
             -------
             -------
             -------
ex:-1.clssmethod
    2.static method
    3.login method

NOTE:->>>  Decorator function will take exactly 1 parameter that is main function name .
'''
'''
CREATION OF DECORATOR:->>>  

def decorator_name(function_name):
	def wrapper(*args,**kwargs):

	    # logic1
	    function_name(*args,**kwargs)
	return wrapper
'''
def check_b(f):
	def wrapper(a,b):
		if b!=0:
			return f(a,b)
		else:
			return"b value should not 0"
	return wrapper
@check_b
def div(a,b):
	return (a/b)
print div(10,2)
print div(10,0)

 	


			




        




