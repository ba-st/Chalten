"
I test the date and time conventions Chalten adds to LocaleConventions, in its #chronology category.
"
Class {
	#name : 'ChronologyConventionsTest',
	#superclass : 'TestCase',
	#instVars : [
		'conventions'
	],
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'private' }
ChronologyConventionsTest >> load: json [

  conventions loadJSONChronologyConventionsFromString: json
]

{ #category : 'private' }
ChronologyConventionsTest >> loadSpanishConventions [

  self load: '{
	"*": {"shortDateFormat": "y-MM-dd", "mediumDateFormat": "y MMM d", "shortTimeFormat": "HH:mm", "amMark": "AM"},
	"es": {"shortDateFormat": "d/M/yy", "mediumDateFormat": "d MMM y", "shortTimeFormat": "H:mm", "amMark": "a. m."},
	"es-AR": {"shortTimeFormat": "h:mm a"}
}'
]

{ #category : 'private' }
ChronologyConventionsTest >> propertyNamed: aName for: aLanguageTag [

  ^ conventions chronologyPropertyNamed: aName for: aLanguageTag
]

{ #category : 'running' }
ChronologyConventionsTest >> setUp [

  super setUp.
  conventions := LocaleConventions new
]

{ #category : 'tests' }
ChronologyConventionsTest >> testChronologyCategory [

  self loadSpanishConventions.

  self
    assert: ( conventions propertyNamed: #shortDateFormat of: #chronology for: 'es-AR' )
    equals: 'd/M/yy';
    assert: ( self propertyNamed: #shortDateFormat for: 'es-AR' ) equals: 'd/M/yy'
]

{ #category : 'tests' }
ChronologyConventionsTest >> testLaterLoadsOverridePropertyByProperty [

  self loadSpanishConventions.
  self load: '{"es": {"mediumDateFormat": "d ''de'' MMM y"}, "fr": {"shortDateFormat": "dd/MM/y"}}'.

  self
    assert: ( self propertyNamed: #mediumDateFormat for: 'es' ) equals: 'd ''de'' MMM y';
    assert: ( self propertyNamed: #shortDateFormat for: 'es' ) equals: 'd/M/yy';
    assert: ( self propertyNamed: #shortDateFormat for: 'fr-CA' ) equals: 'dd/MM/y';
    assert: ( self propertyNamed: #mediumDateFormat for: 'fr-CA' ) equals: 'y MMM d'
]

{ #category : 'tests' }
ChronologyConventionsTest >> testLoadingFromAFile [

  | location file |
  location := FileLocator temp / 'Chalten' / self selector asString.
  location ensureCreateDirectory.
  [
    file := location / 'chronology.json'.
    file writeStreamDo: [ :stream | stream nextPutAll: '{"es": {"shortDateFormat": "d/M/yy"}}' ].
    conventions loadJSONChronologyConventionsFrom: file
  ] ensure: [ location ensureDeleteAll ].

  self assert: ( self propertyNamed: #shortDateFormat for: 'es-AR' ) equals: 'd/M/yy'
]

{ #category : 'tests' }
ChronologyConventionsTest >> testMarksAreNotPatterns [

  self load: '{"es": {"amMark": "a. m.", "pmMark": "p. m."}}'.

  self
    assert: ( self propertyNamed: #amMark for: 'es' ) equals: 'a. m.';
    assert: ( self propertyNamed: #pmMark for: 'es' ) equals: 'p. m.'
]

{ #category : 'tests' }
ChronologyConventionsTest >> testPropertyNames [

  self load: '{}'.

  LocaleConventions chronologyPropertyNames do: [ :name |
      self
        should: [ self propertyNamed: name for: 'es' ]
        raise: ObjectNotFound
        withMessageText: 'There''s no ' , name , ' convention for es'
    ]
]

{ #category : 'tests' }
ChronologyConventionsTest >> testPropertyNotDefined [

  self load: '{"es": {"shortDateFormat": "d/M/yy"}}'.

  self
    should: [ self propertyNamed: #longDateFormat for: 'es-AR' ]
    raise: ObjectNotFound
    withMessageText: 'There''s no longDateFormat convention for es-AR'
]

{ #category : 'tests' }
ChronologyConventionsTest >> testPropertyResolvedFromTheMostSpecificRange [

  self loadSpanishConventions.

  self
    assert: ( self propertyNamed: #shortTimeFormat for: 'es-AR' )
    equals: 'h:mm' , ( String with: ( Character codePoint: 16r202F ) ) , 'a';
    assert: ( self propertyNamed: #shortDateFormat for: 'es-AR' ) equals: 'd/M/yy';
    assert: ( self propertyNamed: #shortTimeFormat for: 'es-ES' ) equals: 'H:mm';
    assert: ( self propertyNamed: #amMark for: 'es-AR' ) equals: 'a. m.';
    assert: ( self propertyNamed: #shortDateFormat for: 'en' ) equals: 'y-MM-dd';
    assert: ( self propertyNamed: #amMark for: 'en-GB' ) equals: 'AM'
]

{ #category : 'tests' }
ChronologyConventionsTest >> testUnknownProperty [

  self
    should: [ self load: '{"es": {"shortDate": "d/M/yy"}}' ]
    raise: AssertionFailed
    withMessageText: 'shortDate is not a convention of the chronology category'
]

{ #category : 'tests' }
ChronologyConventionsTest >> testUnsupportedFieldsAreRejectedBeforeLoading [

  self load: '{"es": {"shortDateFormat": "d/M/yy"}}'.

  self
    should: [
      self load: '{"es": {"shortDateFormat": "d/M/y G"}, "fr": {"shortDateFormat": "dd/MM/y"}}' ]
    raise: InstanceCreationFailed
    withMessageText: 'The field G is not supported in date and time patterns'.

  self
    assert: ( self propertyNamed: #shortDateFormat for: 'es' ) equals: 'd/M/yy';
    should: [ self propertyNamed: #shortDateFormat for: 'fr' ] raise: ObjectNotFound
]
